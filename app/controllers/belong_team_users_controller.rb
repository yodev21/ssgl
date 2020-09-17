# frozen_string_literal: true

class BelongTeamUsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where(id: Assign.where(team_id: params[:team_id]).select('user_id')).includes(:assigns).order(created_at: :desc)
  end

  def show
    assign = Assign.find_by(id: [params[:assign_id]])
    # user_id = params[:user_id].nil? ? params[:id] : params[:user_id]
    # @user = User.find_by(id: user_id)
    @user = assign.user
    @assign_user = Assign.find_by(user_id: @user.id, team_id: params[:team_id])
    @admin_user = Assign.find_by(user_id: current_user.id, team_id: @assign_user.team.id)
  end
end
