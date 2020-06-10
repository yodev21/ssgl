class AssignsController < ApplicationController

  def create
    team = Team.find(params[:team_id])
    @assign = Assign.new(status: :member, team_id: team.id, user_id: current_user.id)
    if @assign.save
      redirect_to team_path(team.id), notice: "チームに加入しました！"
    else
      redirect_to team_pat(team.id), alert: "チームの加入に失敗しました！"
    end
  end
end
