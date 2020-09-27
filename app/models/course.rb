class Course < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  has_many :challenge_courses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :challenge_starts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :image, presence: true

  enum status: { release: 0, limited_release: 1, secret: 2 }

  scope :belong_to_team_all, lambda { |id: '', team_id: '', assign_id: ''|
    next if id.nil? && team_id.nil? && assign_id.nil?

    Couse.where(team_id: team_id,
                assign_id: assign_id)
  }

  scope :with_title, lambda { |title|
    next if title.nil?
    where('tasks.title LIKE ?', "%'#{title}'%")
  }
end
