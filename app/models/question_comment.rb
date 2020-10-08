class QuestionComment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :challenge_start

  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
