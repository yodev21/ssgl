# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'クエスチョン追加機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testTask@example.com')
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
    end

    example '必要なデータがあれば有効な状態であること' do
      question = Question.new(
        title: 'test Title',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: @user.id,
        assign_id: @assign.id,
        challenge_course_id: @challenge_course.id,
        challenge_start_id: @challenge_start.id
      )
      expect(question).to be_valid
    end
  end
end