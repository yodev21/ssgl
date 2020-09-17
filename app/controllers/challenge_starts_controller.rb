# frozen_string_literal: true

class ChallengeStartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge_tasks = ChallengeStart.get_ansers(user: current_user).includes(:task).with_challenge_start_title(params[:name]).with_challenge_start_status(params[:status])
  end

  def create
    @challenge = ChallengeStart.create_challenge_start(task: params[:task_id], user: current_user)
    redirect_to task_path(user_id: current_user.id,
                          team_id: @challenge.team.id,
                          assign_id: @challenge.assign.id,
                          id: params[:task_id]),
                notice: 'こちらの課題に取り組みました。'
  end

  def update
    challenge = ChallengeStart.find(params[:id])
    challenge.update(status: :complete)
    redirect_to task_path(user_id: current_user.id,
                          team_id: challenge.team.id,
                          assign_id: challenge,
                          challenge_start_id: challenge.id,
                          id: challenge.task.id),
                notice: '課題完了しました。'
  end

  def destroy
    @challenge = ChallengeStart.find_challenge_start(task: params[:task_id])
    @challenge.destroy
    redirect_to task_path(team_id: params[:team_id],
                          assign_id: params[:assign_id],
                          id: params[:task_id]),

    # redirect_to task_path(id: params[:team_id]),
                notice: 'こちらの課題を取り消しました。'
  end
end
