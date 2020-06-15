class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :tasks, dependent: :destroy
  has_many :challenge_starts, dependent: :destroy

  validates :status, presence: true

  enum status: { admin: 0, memtor: 1, member: 2}
  
end
