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

  private
  scope :belong_to_team_all, -> (id: id, team_id: team_id, assign_id: assign_id) do
    next if id.nil? && team_id.nil? && assign_id.nil?
    Task.where(team_id: team_id,
               assign_id: assign_id)
  end

  scope :with_name, -> (title: title) do
    next if title.nil?
    where("title LIKE ?", "%#{title}%")
  end
end
