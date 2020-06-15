class ChallengeStart < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum status: { complete: 0 , underway: 1 , awaiting_review: 2}

  private
  scope :create_challenge_start, -> (task: task, deadline: "") do
    next if task.nil?
    task = Task.find(task)
    user = User.find(task.user_id)
    team = Team.find(task.team_id)
    assign = Assign.find(task.assign_id)
    create(status: :underway,
           deadline: "",
           user_id: user.id,
           team_id: team.id,
           assign_id: assign.id,
           task_id: task.id)
  end

  scope :find_challenge_start, -> (task: task) do
    next if task.nil?
    ChallengeStart.find_by(task_id: task)
  end

  scope :get_ansers, -> (user: user) do
    where(user_id: user.id)
  end
end
