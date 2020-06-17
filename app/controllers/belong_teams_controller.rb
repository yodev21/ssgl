class BelongTeamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.where(id: Assign.where(user_id: current_user.id).select("team_id")).includes(:assigns).order(created_at: :desc)
  end

  def show 
    @team = Team.find(params[:id])
  end
end
