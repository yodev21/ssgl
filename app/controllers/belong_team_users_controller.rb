class BelongTeamUsersController < ApplicationController
  def index
    @users = User.where(id: Assign.where(id: params[:assign_id]).select("user_id"))
  end
end
