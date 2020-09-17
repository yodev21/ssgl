# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe '回答機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testAnswerSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_start = FactoryBot.create(:challenge_start, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, task_id: @task.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testAnswerSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example '回答ができること' do
      visit task_path(user_id: @user.id, team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '回答'
      fill_in 'answer_content', with: 'テスト コンテント'
      click_button '回答'
      wait.until { expect(page).to have_content '回答しました' }
    end

    example '回答が編集できること' do
      visit task_path(user_id: @user.id, team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '回答'
      fill_in 'answer_content', with: 'テスト コンテント'
      click_button '回答'
      visit task_path(user_id: @user.id, team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      visit edit_task_challenge_start_answer_path(team_id: @team.id, assign_id: @assign.id, task_id: @task.id, challenge_start_id: @challenge_start.id, id: @challenge_start.answers.first)
      fill_in 'answer_content', with: 'テスト コンテント Update'
      click_button '回答'
      wait.until { expect(page).to have_content '更新しました' }
    end
  end
end
