require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "回答機能" do
    before do
      @user = FactoryBot.create(:user, email: "testChallengeStart@example.com")
      @team = FactoryBot.create(
        :team, 
        name: "test Team",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/yay.png')),
        user_id: @user.id
        )
      @assign = FactoryBot.create(
        :assign,
        user_id: @user.id,
        team_id: @team.id,
      )
      @task = FactoryBot.create(
        :task,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id
      )
    end
      @challenge_start = FactoryBot.create(
        :task,
        user_id: @user.id,
        team_id: @team.id,
        assign_id: @assign.id
      )
    end
  end
end