# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenge_starts', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe 'チャレンジ機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testChallenge_startsSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testChallenge_startsSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example 'タスクに取り組むことができること' do
      visit task_path(team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '取り組む'
      wait.until { expect(page).to have_content 'こちらの課題に取り組みました' }
    end

    example 'タスクを取り消すことができること' do
      visit task_path(team_id: @team.id, assign_id: @assign.id, id: @assign.tasks.first)
      click_link '取り組む'
      click_link '諦める'
      page.driver.browser.switch_to.alert.accept
      wait.until { expect(page).to have_content 'こちらの課題を取り消しました' }
    end
  end
end
