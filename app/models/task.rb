class Task < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  has_many :challenge_starts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :feed_backs, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50}
  validates :content, presence: true
end
