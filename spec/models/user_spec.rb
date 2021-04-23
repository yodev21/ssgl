# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'ユーザー機能' do
    example '名前、メール、パスワードがあれば有効な状態であること' do
      user = User.new(
        name: 'test User',
        email: 'testUser1@example.com',
        image: open("#{Rails.root}/app/assets/images/users/1.png"),
        password: 'testtest'
      )
      expect(user).to be_valid
    end

    example '名前がなければ無効な状態であること' do
      user = User.new(
        email: 'testUser2@example.com',
        password: 'testtest'
      )
      expect(user).not_to be_valid
    end

    example 'メールがなければ無効な状態であること' do
      user = User.new(
        name: 'test User',
        password: 'testtest'
      )
      expect(user).not_to be_valid
    end

    example 'パスワードがなければ無効な状態であること' do
      user = User.new(
        name: 'test User',
        email: 'testUser3@example.com'
      )
      expect(user).not_to be_valid
    end

    example '重複したメールアドレスなら無効な状態であること' do
      User.create(
        name: 'test User',
        email: 'testUser4@example.com',
        password: 'testtest'
      )
      other = User.new(
        name: 'test User',
        email: 'testUser4@example.com',
        password: 'testtest'
      )
      expect(other).not_to be_valid
    end
  end
end
