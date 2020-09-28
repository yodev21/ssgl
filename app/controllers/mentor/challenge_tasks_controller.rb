class Mentor::ChallengeTasksController < ApplicationController
  def create
    challenge = ChallengeStart.find(params[:id])
    challenge.update(status: :complete)
    redirect_to mentor_task_path(id: challenge.task.id), notice: 'タスク完了しました。'
  end
end
