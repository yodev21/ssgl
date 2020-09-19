# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe 'コメント機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testAnswerSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_start = FactoryBot.create(:challenge_start, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, task_id: @task.id)
      @answer = FactoryBot.create(:answer, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, task_id: @task.id, challenge_start_id: @challenge_start.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testAnswerSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example 'コメントができること' do
      visit task_path(team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '回答'
      fill_in 'answer_content', with: 'テスト コンテント'
      click_button '回答'
      choose '1'
      fill_in 'feed_back_reason', with: 'テスト フィードバック'
      click_button '送信'
      fill_in 'comment_content', with: 'テスト コメント'
      click_button 'コメント'
      wait.until { expect(page).to have_content 'テスト コメント' }
    end

    example 'コメントの削除ができること', retry: 3 do
      visit task_path(team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '回答'
      fill_in 'answer_content', with: 'テスト コンテント'
      click_button '回答'
      choose '1'
      fill_in 'feed_back_reason', with: 'テスト フィードバック'
      click_button '送信'
      fill_in 'comment_content', with: 'テスト コメント'
      click_button 'コメント'
      click_link 'コメント削除'
      sleep(1)
      page.driver.browser.switch_to.alert.accept
      # wait.until { expect(page).not_to have_content 'テスト コメント' }
    end
  end
end
