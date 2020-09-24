# frozen_string_literal: true

class BelongTeamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.where(id: Assign.where(user_id: current_user.id).select('team_id')).includes(:assigns).order(created_at: :desc)
  end

  def show
    @team = Team.find(params[:id])
    @tasks = Task.where(team_id: @team.id)
  end

  def search
    team_search = BelongTeamSearch.new(params_team_search)
    @teams = team_search.execute
    render 'belong_teams/index'
  end

  private

  def params_team_search
    params.permit(:search_name)
  end
end
