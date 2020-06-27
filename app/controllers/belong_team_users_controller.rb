class BelongTeamUsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where(id: Assign.where(team_id: params[:team_id]).select("user_id")).includes(:assigns).order(created_at: :desc)
  end

  def show
    @admin_user = Assign.find_by(user_id: current_user.id,
                                 team_id: params[:team_id])
    @assign_user = Assign.where(id: params[:assign_id]).includes(:user)
  end
end
