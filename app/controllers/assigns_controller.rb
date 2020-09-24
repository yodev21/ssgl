# frozen_string_literal: true

class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.find(params[:team_id])
    @assign = Assign.new(status: :member,
                         team_id: team.id,
                         user_id: current_user.id)
    if @assign.save
      redirect_to team_path(team.id), notice: 'チームに加入しました。'
    else
      redirect_to team_path(team.id), alert: 'チームの加入に失敗しました。'
    end
  end

  def update
    @assign = Assign.find_by(id: params[:id])
    if @assign.update(status: params[:status])
      redirect_to belong_team_user_path(team_id: @assign.team_id,
                                        user_id: @assign.user.id),
                  notice: '状態を更新しました。'
    else
      redirect_to belong_team_user_path(team_id: @assign.team_id,
                                        assign_id: @assign.id),
                  alert: '状態の更新に失敗しました。'
    end
  end

  def destroy
    @assign = Assign.find_by(id: params[:id])
    @assign.destroy
    redirect_to teams_path, notice: 'チームから退会しました。'
  end
end
