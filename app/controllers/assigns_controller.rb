class AssignsController < ApplicationController

  def create
    team = Team.find(params[:team_id])
    @assign = Assign.new(status: :member, team_id: team.id, user_id: current_user.id)
    if @assign.save
      redirect_to team_assign_tasks_path(assign_id: @assign.id), notice: "チームに加入しました！"
    else
      redirect_to team_path(team.id), alert: "チームの加入に失敗しました！"
    end
  end

  def destroy
    @assign = Assign.find(params[:id])
    @assign.destroy
    redirect_to teams_path, notice: "チームの退会しました！"
  end

end
