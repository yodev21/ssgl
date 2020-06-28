# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]
  before_action :admin_check
  before_action :authenticate_user!
  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      @assign = @team.join_team(status: :admin, user: @team.user_id)
      redirect_to new_team_assign_task_path(assign_id: @assign.id,
                                            team_id: @assign.team_id),
                  notice: 'チームを作成しました。 次に課題を作成してください。'
    else
      flash.now[:danger] = 'チームの作成に失敗しました。'
      render :new
    end
  end

  def index
    @teams = Team.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @assign = Assign.find_by(user_id: current_user, team_id: @team.id)
    @assigns = Assign.where(team_id: params[:id]).includes(:user)
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to teams_path, notice: 'チーム情報を更新しました。'
    else
      flash.now[:alert] = 'チーム情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: 'チームを削除しました。'
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
