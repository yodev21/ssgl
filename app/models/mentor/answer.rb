class Mentor::Answer < ApplicationRecord
  scope :mentor_answers_index, lambda { |current_user|
    where(team_id: Assign.where(user_id: current_user.id).select(:team_id)) 
  }
end