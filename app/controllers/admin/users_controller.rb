class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: %i[show edit update destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to administrators_path, notice: 'ユーザーを登録しました。'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def index
    @user_count = User.all.count
    @users = User.all.order(updated_at: :desc)
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: '削除しました。'
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :image,
                                 :admin,
                                 :password,
                                 :password_confirmation)
  end
end
