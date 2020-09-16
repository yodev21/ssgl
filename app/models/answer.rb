# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task
  belongs_to :challenge_start
  has_many :comments, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  validates :content, presence: true
end
