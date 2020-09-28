# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Mentor::User
  has_many :teams, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :challenge_courses, dependent: :destroy
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

  enum status: { member: 0, mentor: 1,}

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
      if self.email != "guest@example.com"
        errors.add(:name, "はゲストユーザーのため更新できません！")
      end
    end
  end


  # メンター用
  scope :mentor_users_answer, lambda { |current_user_id|
  sql = 
  "
  SELECT 
    users.id,
    users.name,
    users.image,
    answers.id AS answer_id,
    answers.updated_at
  FROM answers
    INNER JOIN challenge_starts
      ON answers.challenge_start_id = challenge_starts.id
    INNER JOIN tasks
      ON challenge_starts.task_id = tasks.id
    INNER JOIN challenge_courses
      ON tasks.challenge_course_id = challenge_courses.id
    INNER JOIN courses
      ON challenge_courses.course_id = courses.id
    INNER JOIN assigns
      ON courses.assign_id = assigns.id
    INNER JOIN teams
      ON assigns.team_id = teams.id
    INNER JOIN users
      ON teams.user_id = users.id
  WHERE
    teams.user_id = :current_user_id
  "
  find_by_sql([sql, {current_user_id: current_user_id}])
}  
end
