# frozen_string_literal: true

class Assign < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :tasks, dependent: :destroy
  has_many :challenge_starts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  validates :status, presence: true
  validates :team_id, uniqueness: { scope: :user_id }

  enum status: { admin: 0, memtor: 1, member: 2 }
end
