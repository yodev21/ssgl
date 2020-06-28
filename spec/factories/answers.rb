# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    url { 'testUrl' }
    content { 'test Content' }
    user_id { 1 }
    team_id { 1 }
    assign_id { 1 }
    task_id { 1 }
    challenge_start_id { 1 }
  end
end
