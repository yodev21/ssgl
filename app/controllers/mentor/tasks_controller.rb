class Mentor::TasksController < ApplicationController
  before_action :set_params, only: %i[edit update destroy]
  before_action :authenticate_user!
  def new
    @task = Task.new
  end

  
  def create
    @course = ChallengeCourse.find_by(user_id: current_user.id, course_id: params[:course_id])
    @task = @course.tasks.build(task_params)
    @task.user_id = current_user.id
    @task.team_id = @course.team_id
    @task.assign_id = @course.assign_id
    @task.course_id = @course.course_id
    if @task.save
      ChallengeStart.create_challenge_start(task_id: @task.id, user_id: current_user.id)
      redirect_to mentor_team_path(id: @task.team_id), notice: 'タスクを作成しました！'
    else
      redirect_to mentor_team_path(id: @task.team_id), alert: 'タスクの作成に失敗しました！'
    end
  end

  def index
    @team = Team.find_by(id: params[:id])
    @assign = Assign.find_by(team_id: @team.id,
                             user_id: current_user.id)
    @tasks = Task.belong_to_team_all(team_id: @team.id,
                                     assign_id: @assign.id)
                 .with_title(params[:title])
                 .order(priority_no: :asc)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    # @answer = Answer.find_by(task_id: @task.id)
    @user_status = Assign.find_by(user_id: current_user.id)

    @challenge_task = ChallengeStart.find_by(user_id: current_user.id,
                                             task_id: @task.id)

    @challenge_tasks = ChallengeStart.where(team_id: @task.team.id,
                                            task_id: @task.id)
                                     .includes(:user)
                                     .with_challenge_start_name(params[:name])
                                     .with_challenge_start_status(params[:status])

    @answers = ChallengeStart.where(user_id: Answer.where(team_id: @task.team.id,
                                                          assign_id: @task.assign.id,
                                                          task_id: @task.id).select('user_id'))
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to mentor_task_path(@task), notice: 'タスクを更新しました！'
    else
      redirect_to mentor_task_path(@task), notice: 'タスクの更新に失敗しました！'
    end
  end

  def destroy
    @task.destroy
    redirect_to challenge_starts_path, notice: 'タスクを削除しました！'
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :content,
                                 :image,
                                 :priority_no)
  end

  def set_params
    @task = Task.find_by(id: params[:id])
  end
end
