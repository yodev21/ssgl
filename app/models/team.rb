class Team < ApplicationRecord
  belongs_to :user
  has_many :assigns, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader

  def join_team(status: status, user: user)
    assigns.create(status: status, user_id: user.to_i)
  end
end
