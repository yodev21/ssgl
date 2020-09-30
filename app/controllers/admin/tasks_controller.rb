class Admin::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: %i[show destroy]
  
  def index
    @tasks = Task.order(updated_at: :desc).page(params[:page])
  end

  def show; end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path, notice: "削除しました！"
  end

  private

  def set_params
    @task = Task.find_by(id: params[:id])
  end
end
