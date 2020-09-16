# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@example.com' }
    image { open("#{Rails.root}/app/assets/images/users/1.png") }
    password { 'testtest' }
  end
end
