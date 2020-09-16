# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { 'テスト コンテント' }
    user_id { 1 }
    team_id { 1 }
    assign_id { 1 }
    task_id { 1 }
    challenge_start_id { 1 }
    answer_id { 1 }
  end
end
