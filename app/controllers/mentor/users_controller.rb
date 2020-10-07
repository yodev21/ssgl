class Mentor::UsersController < ApplicationController
  def index
    @assigns = Assign.includes(:user).where(team_id: params[:team_id]).order(updated_at: :desc)
  end

  def show
    @user = Assign.includes(:user).find_by(user_id: params[:id])
    @complete_task = ChallengeStart.where(user_id: params[:id]).where(status: :complete).count
    @feedback_average = FeedBack.where(user_id: params[:id]).average(:feeling_number)
    # 質問数の実装
    @team_join_day = Assign.find_by(team_id: params[:team_id], user_id: params[:id])
    @latest_tasks = ChallengeStart.where(user_id: params[:id]).where.not(status: :complete).limit(20).order(updated_at: :desc)
  end
end
