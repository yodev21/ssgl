class TasksController < ApplicationController
  def index
    @teams = Team.where(id: Assign.where(user_id: current_user.id).select("team_id")).includes(:assigns).order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end
end
