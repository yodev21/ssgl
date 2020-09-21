# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_params, only: %i[edit update destroy]
  before_action :authenticate_user!
  def new
    @challenge_course = ChallengeCourse.find(params[:challenge_course_id])
    @task = Task.new
  end

  def create
    @challenge_course = ChallengeCourse.find(params[:challenge_course_id])
    @task = @challenge_course.tasks.build(task_params)
    @task.user_id = current_user.id
    @task.team_id = @challenge_course.team_id
    @task.assign_id = @challenge_course.assign_id
    @task.course_id = @challenge_course.course_id
    if @task.save
      redirect_to challenge_courses_path(id: @task.team_id,
                             assign_id: @task.assign_id),
                             notice: '課題を作成しました！'
    else
      redirect_to tasks_path(id: @task.team_id,
                             assign_id: @task.assign_id),
                             alert: '課題の作成に失敗しました！'
    end
  end

  def index
    @team = Team.find_by(id: params[:id])
    @assign = Assign.find_by(team_id: @team.id,
                             user_id: current_user.id)
    @tasks = Task.belong_to_team_all(team_id: @team.id,
                                     assign_id: @assign.id)
                 .with_title(params[:title])
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    @answer = Answer.find_by(
      user_id: @task.user.id,
      team_id: @task.team.id,
      assign_id: @task.assign.id,
      task_id: @task.id
    )
    @user_status = Assign.find_by(user_id: current_user.id)

    @challenge_task = ChallengeStart.find_by(user_id: current_user.id,
                                             task_id: @task.id)

    @challenge_users = ChallengeStart.where(team_id: @task.team.id,
                                            task_id: @task.id)
                                     .with_challenge_start_name(params[:name])
                                     .with_challenge_start_status(params[:status])

    @answers = ChallengeStart.where(user_id: Answer.where(team_id: @task.team.id,
                                                          assign_id: @task.assign.id,
                                                          task_id: @task.id).select('user_id'))
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: '課題を更新しました！'
    else
      redirect_to tasks_path(@task), notice: '課題の更新に失敗しました！'
    end
  end

  def destroy
    @task.destroy
    redirect_to challenge_starts_path, notice: '課題を削除しました！'
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :content,
                                 :image)
  end

  def set_params
    @task = Task.find_by(id: params[:id])
  end
end
