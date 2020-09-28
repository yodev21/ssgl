require 'rails_helper'

RSpec.describe Mentor::User, type: :model do
  describe 'メンター' do
    before do
      @user = FactoryBot.create(:user, email: 'testanswer@example.com')
      @team = FactoryBot.create(
        :team,
        name: 'test Team',
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/yay.png')),
        user_id: @user.id
      )
      @assign = FactoryBot.create(
        :assign,
        user_id: @user.id,
        team_id: @team.id
      )
      @course = FactoryBot.create(
        :course,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id
      )
      @challenge_course = FactoryBot.create(
        :challenge_course,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id
      )
      @task = FactoryBot.create(
        :task,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      @challenge_start = FactoryBot.create(
        :challenge_start,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      @answer = FactoryBot.create(
        :answer,
        content: 'テストコンテント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        challenge_start_id: @challenge_start.id,
        task_id: @task.id
      )
    end
    example '所属しているチームの回答一覧が取得できること' do
      users = Mentor::User.mentor_users_answer(@user)
      expect(users.first.email).to eq "testanswer@example.com"
    end
  end
end