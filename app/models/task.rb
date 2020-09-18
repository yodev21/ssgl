# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :course
  has_many :challenge_starts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :feed_backs, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :image, presence: true

  scope :belong_to_team_all, lambda { |id: '', team_id: '', assign_id: ''|
    next if id.nil? && team_id.nil? && assign_id.nil?

    Task.where(team_id: team_id,
               assign_id: assign_id)
  }

  scope :with_title, lambda { |title|
    next if title.nil?
    where('tasks.title LIKE ?', "%'#{title}'%")
  }
end
