class ChallengeStartsController < ApplicationController

  def index
    @challenge_tasks = ChallengeStart.get_ansers(user: current_user).includes(:task)
  end

  def create
    @challenge = ChallengeStart.create_challenge_start(task: params[:task_id])
    redirect_to team_assign_task_path(team_id: params[:team_id],
                                       assign_id: params[:assign_id],
                                       id: params[:task_id]),
                                       notice: "こちらの課題に取り組みました！"
  end
  def destroy
    @challenge = ChallengeStart.find_challenge_start(task: params[:task_id])
    @challenge.destroy
    redirect_to team_assign_task_path(team_id: params[:team_id],
                                       assign_id: params[:assign_id],
                                       id: params[:task_id]),
                                       notice: "こちらの課題を取り消しました！"
  end
end