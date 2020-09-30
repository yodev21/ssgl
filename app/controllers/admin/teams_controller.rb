class Admin::TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: %i[show destroy]
  def index 
    @teams = Team.order(updated_at: :desc).page(params[:page])
  end

  def show; end

  def destroy
    @team.destroy
    redirect_to admin_teams_path, notice: "削除しました！"
  end

  private

  def set_params
    @team = Team.find(params[:id])
  end
end
