class ChallengeStart < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task
end
