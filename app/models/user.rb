# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :teams, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :challenge_starts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validate :check_guest_user

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def check_guest_user
    if self.id.present? && created_at < '2020/07/01 00:00:00'
       errors.add(:name, "はゲストユーザーのため更新できません！")
    end
  end
end
