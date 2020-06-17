class UsersController < ApplicationController
  before_action :set_params, only: [:show, :destroy]
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to new_user_registration_path, notice: "退会しました"
  end

  private
  def set_params
    @user = User.find(params[:id])
  end
  
end
