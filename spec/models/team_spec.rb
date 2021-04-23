# frozen_string_literal: true

RSpec.describe Team, type: :model do
  describe 'チーム機能' do
    before do
      @user = FactoryBot.create(:user, email: 'testTeam@example.com')
    end
    example '名前があれば有効な状態であること' do
      team = Team.new(
        name: 'test Team',
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/yay.png')),
        user_id: @user.id
      )
      expect(team).to be_valid
    end
    example '名前がなければ無効な状態であること' do
      team = Team.new(
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/yay.png')),
        user_id: @user.id
      )
      expect(team).not_to be_valid
    end
  end
end
