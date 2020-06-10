class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :status, presence: true
end
