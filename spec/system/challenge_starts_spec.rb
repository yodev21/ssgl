# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenge_starts', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe 'チャレンジ機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testChallenge_startsSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @course = FactoryBot.create(:course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_course = FactoryBot.create(:challenge_course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testChallenge_startsSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example 'タスクに取り組むことができること' do
      visit task_path(@task)
      click_link '取り組む'
      wait.until { expect(page).to have_content 'こちらのタスクに取り組みました' }
    end
  end
end
