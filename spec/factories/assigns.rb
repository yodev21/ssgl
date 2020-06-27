# frozen_string_literal: true

FactoryBot.define do
  factory :assign do
    status { 0 }
    user_id { nil }
    team_id { nil }
  end
end
