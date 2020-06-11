class BelongTeamUsersController < ApplicationController
  def index
    @users = User.where(id: Assign.where(team_id: params[:team_id]).select("user_id")).includes(:assigns).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
