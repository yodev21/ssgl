# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '回答機能' do
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
      @task = FactoryBot.create(
        :task,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id
      )
      @challenge_start = FactoryBot.create(
        :challenge_start,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id
      )
    end

    example '必要なデータがあれば有効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).to be_valid
    end

    example 'urlが空白でもコメントがあれば有効な状態であること' do
      answers = Answer.new(
        url: '',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).to be_valid
    end

    example 'コメントが空白の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: '',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).not_to be_valid
    end

    example 'ユーザーIDが無効な値の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: nil,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).not_to be_valid
    end

    example 'チームIDが無効な値の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: nil,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).not_to be_valid
    end

    example 'アサインIDが無効な値の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: nil,
        task_id: @task.id,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).not_to be_valid
    end

    example 'タスクIDが無効な値の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: nil,
        challenge_start_id: @challenge_start.id
      )
      expect(answers).not_to be_valid
    end

    example 'チャレンジスタートIDが無効な値の場合無効な状態であること' do
      answers = Answer.new(
        url: 'テスト ユーアールエル',
        content: 'テスト コメント',
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id,
        task_id: @task.id,
        challenge_start_id: nil
      )
      expect(answers).not_to be_valid
    end
  end
end
