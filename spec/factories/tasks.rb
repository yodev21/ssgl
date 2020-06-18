FactoryBot.define do
  factory :task do
    title { "test Title" }
    content { "test Content" }
    user_id { 1 }
    team_id { 1 }
    assign_id { 1 }
  end
end
