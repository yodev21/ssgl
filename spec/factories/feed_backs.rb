FactoryBot.define do
  factory :feed_back do
    feeling_number { 1 }
    reason { "テスト リーズン" }
    team_id { 1 }
    assign_id { 1 }
    task_id { 1 }
    challenge_start_id { 1 }
    answer_id { 1 }
  end
end
