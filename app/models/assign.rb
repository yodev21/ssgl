# frozen_string_literal: true

class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :courses, dependent: :destroy
  has_many :challenge_courses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :challenge_starts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  validates :status, presence: true
  validates :team_id, uniqueness: { scope: :user_id }

  enum status: { admin: 0, mentor: 1, member: 2,  applying: 3, refusal: 4}
end
