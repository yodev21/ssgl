# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe '回答機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testAnswerSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @course = FactoryBot.create(:course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_course = FactoryBot.create(:challenge_course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id)
      @challenge_start = FactoryBot.create(:challenge_start, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id, task_id: @task.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testAnswerSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example '回答ができること'  do
      visit new_answer_path(challenge_start_id: @challenge_start.id)
      fill_in 'answer_content', with: 'テスト コンテント'
      click_on '回答'
      wait.until { expect(page).to have_content '回答しました' }
    end

    example '回答が編集できること' do
      visit new_answer_path(challenge_start_id: @challenge_start.id)
      fill_in 'answer_content', with: 'テスト コンテント'
      click_on '回答'
      click_on "マイコース"
      find(".challenge-courses-link").click
      find(".challenge-course-link").click
      click_on "回答修正"
      fill_in 'answer_content', with: 'テスト コンテント Update'
      click_button '回答'
      wait.until { expect(page).to have_content '更新しました' }
    end
  end
end
