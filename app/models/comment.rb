# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task
  belongs_to :challenge_start
  belongs_to :answer

  validates :content, presence: true
end
