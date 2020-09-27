class Mentor::UsersController < ApplicationController
  def show
    @user = Assign.includes(:user).find_by(user_id: params[:id])
  end
end
