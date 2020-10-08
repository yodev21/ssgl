# frozen_string_literal: true

class ChallengeStart < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task
  belongs_to :course
  belongs_to :challenge_course
  has_many :questions, dependent: :destroy
  has_many :question_comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :feed_backs, dependent: :destroy

  enum status: { complete: 0, underway: 1, awaiting_review: 2, remand: 3 }

  validates :status, presence: true

  scope :create_challenge_start, lambda { |task_id: '', user_id: current_user.id|
    next if task_id.nil?

    task = Task.find(task_id)
    create(status: "underway",
           deadline: '',
           user_id: user_id,
           team_id: task.course.team.id,
           assign_id: task.assign.id,
           course_id: task.course.id,
           challenge_course_id: task.challenge_course.id,
           task_id: task.id)
  }

  scope :find_challenge_start, lambda { |task: ''|
    next if task.nil?

    ChallengeStart.find_by(task_id: task)
  }

  scope :get_ansers, lambda { |user: ''|
    where(user_id: user.id)
  }

  scope :with_challenge_start_name, lambda { |name|
    next if name.nil?

    where(user_id: User.where('name LIKE ?', "%#{name}%").select('id'))
  }

  scope :with_challenge_start_title, lambda { |title|
    next if title.nil?

    where(task_id: Task.where('title LIKE ?', "%#{title}%").select('id'))
  }
  scope :with_challenge_start_status, lambda { |status|
    next if status.nil? || status.blank?

    where(status: status)
  }
end
