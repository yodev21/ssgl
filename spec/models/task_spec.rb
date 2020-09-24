# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスク追加機能' do
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
    end

    example '必要なデータがあれば有効な状態であること' do
      task = Task.new(
        title: 'test Title',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      expect(task).to be_valid
    end

    example 'タイトルが空白であれば無効な状態であること' do
      task = Task.new(
        title: '',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      expect(task).not_to be_valid
    end

    example 'ユーザーIDが無効であれば無効な状態であること' do
      task = Task.new(
        title: 'test Title',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: 1,
        team_id: @team.id,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      expect(task).not_to be_valid
    end

    example 'チームID無効であれば無効な状態であること' do
      task = Task.new(
        title: 'test Title',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: @user.id,
        team_id: 1,
        assign_id: @assign.id,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      expect(task).not_to be_valid
    end

    example 'アサインIDがあれば無効であれば無効な状態であること' do
      task = Task.new(
        title: 'test Title',
        content: 'test Content',
        image: open("#{Rails.root}/app/assets/images/teams/1.png"),
        user_id: @user.id,
        team_id: @team.id,
        assign_id: 1,
        course_id: @course.id,
        challenge_course_id: @challenge_course.id
      )
      expect(task).not_to be_valid
    end
  end
end
