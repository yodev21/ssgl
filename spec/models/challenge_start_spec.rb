# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChallengeStart, type: :model do
  describe 'タスクチャレンジ機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testChallengeStart@example.com')
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
    end
    example '必要なデータがあれば有効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: 0,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      expect(challenge_start).to be_valid
    end

    example 'ステータスが無効であれば無効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: nil,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      expect(challenge_start).not_to be_valid
    end

    example 'ユーザーIDが無効であれば無効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: 0,
        user_id: nil,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      expect(challenge_start).not_to be_valid
    end

    example 'チームIDが無効であれば無効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: 0,
        user_id: @user.id,
        team_id: nil,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      expect(challenge_start).not_to be_valid
    end

    example 'アサインIDが無効であれば無効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: 0,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: nil,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id
      )
      expect(challenge_start).not_to be_valid
    end

    example 'タスクIDが無効であれば無効な状態であること' do
      challenge_start = ChallengeStart.new(
        status: 0,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: nil
      )
      expect(challenge_start).not_to be_valid
    end
  end
end
