class TeamsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      @team.join_team(status: :admin, user: @team.user_id )
      redirect_to teams_path, notice: "チームを作成しました！"
    else
      flash.now[:danger] = "チームの作成に失敗しました！"
      render :new
    end
  end

  def index
    @teams = Team.all.order(created_at: :desc)
  end

  def belong_team_index
    @teams = Team.where(id: Assign.where(user_id: current_user.id).select("team_id")).order(created_at: :desc)
    render 'teams/index'
  end

  def show; end

  def edit; end
 
  def update
    if @team.update(team_params)
      redirect_to teams_path, notice: "チーム情報を更新しました！"
    else
      flash.now[:alert] = "チーム情報の更新に失敗しました！"
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "チームを削除しました！"
  end

  private
  def set_params
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name,:image,:remarks)
  end

end
