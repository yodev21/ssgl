require 'rails_helper'

RSpec.describe ChallengeCoursesController, type: :system do
  wait = Selenium::WebDriver::Wait.new(timeout: 500)

  describe "GET #index" do
    before do
      @user = FactoryBot.create(:user, email: 'challenge_courses@example.com')
      @team = FactoryBot.create(:team, name: 'My Team', user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
      @course = FactoryBot.create(:course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id)
      @challenge_course = FactoryBot.create(:challenge_course, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id)
      
      @task = FactoryBot.create(:task, user_id: @user.id, team_id: @team.id, assign_id: @assign.id, course_id: @course.id, challenge_course_id: @challenge_course.id)
      visit new_user_session_path
      fill_in 'user_email', with: 'challenge_courses@example.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'サインイン'
    end
    example "取り組んでいるコースの一覧が表示されること" do
      click_on "マイコース" 
      wait.until { expect(page).to have_content 'テストコース'}
    end
  end

end
