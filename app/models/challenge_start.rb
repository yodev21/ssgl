class ChallengeStart < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :assign
  belongs_to :task

  enum status: { complete: 0 , underway: 1 }

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
end
