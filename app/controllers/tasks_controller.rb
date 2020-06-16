class TasksController < ApplicationController
  before_action :set_params, only: [:edit, :update, :destroy]
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
      redirect_to team_assign_tasks_path( team_id: @task.team_id, 
                                          assign_id: @task.assign_id),
                                          notice: "課題を作成しました！"
    else
      redirect_to team_assign_tasks_path( team_id: @task.team_id,
                                          assign_id: @task.assign_id),
                                          alert: "課題の作成に失敗しました！"
    end
  end
  
  def index
    @assign = Assign.find_by( id: params[:assign_id] )
    @tasks = Task.where( team_id: params[:team_id],
                         assign_id: params[:assign_id] )
  end

  def show
    @task = Task.find_by(assign_id: params[:assign_id],
                         team_id: params[:team_id],
                         id: params[:id])
    @challenge_task = ChallengeStart.find_by( team_id: params[:team_id],
                                              assign_id: params[:assign_id], 
                                              task_id: @task.id, 
                                              user_id: current_user.id )
  end


  def edit; end

  def update
    if @task.update(task_params)
      redirect_to team_assign_tasks_path( team_id: @task.team_id, 
                                          assign_id: @task.assign_id), 
                                          notice: "課題を更新しました！"
    else
      redirect_to team_assign_tasks_path( team_id: @task.team_id, 
                                          assign_id: @task.assign_id),
                                          notice: "課題の更新に失敗しました！"
    end

  end

  def destroy
    @task.destroy
    redirect_to team_assign_tasks_path( team_id: @task.team_id,
                                        assign_id: @task.assign_id),
                                        notice: "課題を削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:title, 
                                 :content,
                                 :image)
  end

  def set_params
    @task = Task.find_by( id: params[:id] )
  end

end
