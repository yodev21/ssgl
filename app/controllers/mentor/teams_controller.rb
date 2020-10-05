class Mentor::TeamsController < ApplicationController
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
      redirect_to new_mentor_course_path(
        team_id: @assign.team_id),
        notice: 'チームを作成しました。 次にタスクを作成してください。'
    else
      flash.now[:danger] = 'チームの作成に失敗しました。'
      render :new
    end
  end

  def index 
    @teams = Team.where(id: Assign.where(user_id: current_user.id).where.not(status: 'member').select(:team_id)).page
  end

  def show
    @courses = Course.where(team_id: Assign.where(user_id: current_user.id).select(:team_id)).where(team_id: params[:id])
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to mentor_teams_path, notice: 'チーム情報を更新しました。'
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
