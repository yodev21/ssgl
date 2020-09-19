# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_params, only: %i[show destroy]
  before_action :authenticate_user!
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show; end

  def change_status
    user = User.find(current_user.id)
    user.status = user.status == "member" ? "mentor" : "member"
    user.save
    binding.pry
    redirect_to belong_teams_path
  end

  def destroy
    @user.destroy
    redirect_to new_user_registration_path, notice: '退会しました'
  end

  private

  def set_params
    @user = User.find(params[:id])
  end
end
