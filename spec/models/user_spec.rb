require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー機能" do
    example "名前、メール、パスワードがあれば有効な状態であること" do
      user = User.new(
        name: "test User",
        email: "test@example.com",
        password: "testtest"
      )
      expect(user).to be_valid
    end

    example "名前がなければ無効な状態であること" do
      user = User.new(
        email: "test@example.com",
        password: "testtest"
      )
      expect(user).not_to be_valid
    end

    example "メールがなければ無効な状態であること" do
      user = User.new(
        name: "test User",
        password: "testtest"
      )
      expect(user).not_to be_valid
    end

    example "パスワードがなければ無効な状態であること" do
      user = User.new(
        name: "test User",
        email: "test@example.com",
      )
      expect(user).not_to be_valid
    end

    example "重複したメールアドレスなら無効な状態であること" do
      user = User.create(
        name: "test User",
        email: "test@example.com",
        password: "testtest"
      )
      other = User.new(
        name: "test User",
        email: "test@example.com",
        password: "testtest"
      )
      expect(other).not_to be_valid
    end
  end
end
