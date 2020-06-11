class Task < ApplicationRecord
  belongs_to :user
  belongs_to :teams
  belongs_to :assigns

  validates :title, presence: true, length: { maximum: 50}
  validates :content, presence: true
end
