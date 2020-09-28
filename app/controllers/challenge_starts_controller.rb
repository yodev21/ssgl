# frozen_string_literal: true

class ChallengeStartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge_course = ChallengeCourse.find(params[:id])
    @challenge_tasks = Task.where(course_id: @challenge_course.course.id)
  end

  def show
    @task = Task.find_by(id: params[:id])
    @answer = Answer.find_by(task_id: @task.id)
    
    @user_status = Assign.find_by(user_id: current_user.id)

    @challenge_task = ChallengeStart.find_by(user_id: current_user.id,
                                             task_id: @task.id)

    @challenge_users = ChallengeStart.where(task_id: @task.id)
                                     .with_challenge_start_name(params[:name])
                                     .with_challenge_start_status(params[:status])

    @answers = ChallengeStart.where(user_id: Answer.where(team_id: @task.team.id,
                                                          assign_id: @task.assign.id,
                                                          task_id: @task.id).select('user_id'))
  end

  def create
    @challenge = ChallengeStart.create_challenge_start(task_id: params[:task_id], user_id: current_user.id)
    redirect_to task_path(id: params[:task_id]), notice: 'こちらのタスクに取り組みました。'
  end

  def destroy
    @challenge = ChallengeStart.find_challenge_start(task: params[:task_id])
    @challenge.destroy
    redirect_to task_path(team_id: params[:team_id],
                          assign_id: params[:assign_id],
                          id: params[:task_id]),
                notice: 'こちらのタスクを取り消しました。'
  end
end
