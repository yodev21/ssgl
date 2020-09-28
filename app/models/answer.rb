# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :course
  belongs_to :challenge_course
  belongs_to :task
  belongs_to :challenge_start
  has_many :comments, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  validates :content, presence: true
  
  # メンター用
  scope :answer_user, lambda { |answer_id|
    find_by(id: answer_id)
  }
end
