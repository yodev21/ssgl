class Question < ApplicationRecord
  belongs_to :user
  belongs_to :assign
  belongs_to :challenge_course
  belongs_to :challenge_start
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :status, presence: true
  
  enum status: { waiting_answer: 0, temporary_answer: 1, solved: 2}
end
