# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testAnswer@example.com')
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
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
    end

    example '必要なデータがあれば有効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).to be_valid
    end

    example 'コメントが空白であれば無効な状態であること' do
      comment = Comment.new(
        content: '',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'ユーザーIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: nil,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'チームIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: nil,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'アサインIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: nil,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'タスクIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: nil,
        challenge_start_id: @challenge_start.id,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'チャレンジIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: nil,
        answer_id: @answer.id
      )
      expect(comment).not_to be_valid
    end

    example 'アンサーIDが無効な値であれば無効な状態であること' do
      comment = Comment.new(
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id,
        answer_id: nil
      )
      expect(comment).not_to be_valid
    end
  end
end
