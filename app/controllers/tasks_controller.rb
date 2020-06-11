class TasksController < ApplicationController

  def new
    @assign = Assign.find_by(id: params[:assign_id])
    @task = @assign.tasks.build
  end

  def create
    @assign = Assign.find_by(id: params[:assign_id])
    @task = @assign.tasks.build(task_params)
    @task.user_id = current_user.id
    @task.team_id = @assign.team_id
    if @task.save
      redirect_to team_assign_tasks_path(team_id: @task.team_id, assign_id: @task.assign_id), notice: "課題を作成しました！"
    else
      redirect_to team_assign_tasks_path(team_id: @task.team_id, assign_id: @task.assign_id), alert: "課題の作成に失敗しました！"
    end
  end
  
  def index
    # @team_reader = User.find(Team.find_by(user_id: Assign.find_by(id: params[:id])))
    @assign = Assign.find_by(id: params[:assign_id])
    @tasks = Task.where(team_id: params[:team_id], assign_id: params[:assign_id])
  end

  def show
    @task = Task.find_by(assign_id: params[:assign_id], team_id: params[:team_id], id: params[:id])
  end


  def edit
  end

  def update

  end

  def destroy

  end

  private
  def task_params
    params.require(:task).permit(:title, 
                                 :content,
                                 :image)
                                  # .merge(user_id: current_user.id, team_id: Team.find(params[:tesm_id]), assign_id: Assign.find(params[:assign_id]))
  end
end
