class TeamsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to teams_path, notice: "チームを作成しました！"
    else
      flash.now[:danger] = "チームの作成に失敗しました！"
      render :new
    end
  end

  def index
    @teams = Team.all.order(created_at: :desc)
  end

  def show; end

  private
  def set_params
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name,:image,:remarks)
  end

end
