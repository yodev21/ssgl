# frozen_string_literal: true

class AdministratorsController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def top; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_params)
    if @user.save
      redirect_to administrators_path, notice: 'ユーザーを登録しました。'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def index
    @user_count = User.all.count
    @users = User.all.order(created_at: :desc)
  end

  def show; end

  def edit; end

  def update
    if @user.update(admin_params)
      redirect_to administrators_path, notice: 'ユーザー情報を更新しました。'
    else
      flash.now[:alert] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: '削除しました。'
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def admin_params
    params.require(:user).permit(:name,
                                 :email,
                                 :image,
                                 :admin,
                                 :password,
                                 :password_confirmation)
  end

  def current_user_admin_params
    params.require(:administrators).permit(:name,
                                           :email,
                                           :image,
                                           :admin,
                                           :password,
                                           :password_confirmation)
  end
end
