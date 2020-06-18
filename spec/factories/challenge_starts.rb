FactoryBot.define do
  factory :challenge_start do
    status { 0 }
    user_id { 1 }
    team_id { 1 }
    assign_id { 1 }
    task_id { 1 }
  end
end
