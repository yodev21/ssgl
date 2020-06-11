class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :status, presence: true

  enum status: { admin: 0, memtor: 1, member: 2}
  
end
