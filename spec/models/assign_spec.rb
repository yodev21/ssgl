require 'rails_helper'

RSpec.describe Assign, type: :model do
  describe "アサイン機能" do
    before do 
      @user = FactoryBot.create(:user)
      @team = FactoryBot.create(:team, user_id: @user.id)
      @assign = FactoryBot.create(:assign, user_id: @user.id, team_id: @team.id)
    end

    example "ステータスがあれば有効な状態であること" do
      expect(@assign).to be_valid
    end

    example "ステータスがなければ無効な状態であること" do
      assign = Assign.new(status: nil, user_id: @user.id, team_id: @team.id)
      expect(assign).not_to be_valid
    end
  end
end
