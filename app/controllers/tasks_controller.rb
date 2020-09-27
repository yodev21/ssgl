# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    # @team = Team.find_by(id: params[:id])
    # @assign = Assign.find_by(team_id: @team.id,
    #                          user_id: current_user.id)
    # @tasks = Task.belong_to_team_all(team_id: @team.id,
    #                                  assign_id: @assign.id)
    #              .with_title(params[:title])
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    @answer = Answer.find_by(task_id: @task.id)
    # @user_status = Assign.find_by(user_id: current_user.id)

    @challenge_task = ChallengeStart.find_by(user_id: current_user.id,
                                             task_id: @task.id)

    # @challenge_users = ChallengeStart.where(team_id: @task.team.id,
    #                                         task_id: @task.id)
    #                                  .with_challenge_start_name(params[:name])
    #                                  .with_challenge_start_status(params[:status])

    # @answers = ChallengeStart.where(user_id: Answer.where(team_id: @task.team.id,
                                                          # assign_id: @task.assign.id,
                                                          # task_id: @task.id).select('user_id'))
  end
end
