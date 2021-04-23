# frozen_string_literal: true


RSpec.describe 'Answers', type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)
  describe 'フィードバック機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testFeedBackSystem@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @course = FactoryBot.create(:course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_course = FactoryBot.create(:challenge_course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id)
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id)
      @challenge_start = FactoryBot.create(:challenge_start, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id, task_id: @task.id)
      @answer = FactoryBot.create(:answer, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id, task_id: @task.id, challenge_start_id: @challenge_start.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'testFeedBackSystem@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end

    example 'フィードバックが送信できること' do
      visit new_answer_path(challenge_start_id: @challenge_start.id)
      fill_in 'answer_content', with: 'テスト コンテント'
      click_on '回答'
      choose '1'
      fill_in 'feed_back_reason', with: 'テスト フィードバック'
      click_button '送信'
      wait.until { expect(page).to have_content 'フィードバックを送信しました' }
    end
  end
end
