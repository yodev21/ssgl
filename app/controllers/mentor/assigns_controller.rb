class Mentor::AssignsController < ApplicationController
  def update
    @assign = Assign.find_by(user_id: params[:id])
    if @assign.update(status: params[:status])
      redirect_to mentor_user_path(team_id: @assign.team_id,
                                   user_id: @assign.user.id),
                  notice: '状態を更新しました。'
    else
      redirect_to mentor_user_path(team_id: @assign.team_id,
                                   assign_id: @assign.id),
                  alert: '状態の更新に失敗しました。'
    end
  end

  def destroy
    @assign = Assign.find_by(id: params[:id])
    @assign.destroy
    redirect_to mentor_teams_path, notice: 'チームから退会しました。'
  end
end
