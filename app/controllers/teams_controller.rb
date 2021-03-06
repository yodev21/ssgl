# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :admin_check
  before_action :authenticate_user!

  def index 
    @teams = Team.order(updated_at: :desc).page(params[:page])
  end

  def show
    @team = Team.find(params[:id])
    @assign = Assign.find_by(user_id: current_user, team_id: @team.id)
    @assigns = Assign.where(team_id: params[:id]).includes(:user)
  end

  def search
    team_search = TeamSearch.new(params_team_search)
    @teams = team_search.execute
    render 'teams/index'
  end

  private

  def set_params
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :image, :remarks)
  end

  def admin_check
    if current_user.present? && current_user.admin?
      redirect_to administrator_top_path(administrator_id: current_user.id)
    end
  end

  def params_team_search
    params.permit(:search_name)
  end

end
