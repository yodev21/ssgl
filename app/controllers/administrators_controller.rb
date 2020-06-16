class AdministratorsController < ApplicationController
  before_action :set_params, only:[:show, :edit, :update, :destroy]
  def top

  end
  
  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "削除しました。"
  end

  private
  def set_params
    @user = User.find(params[:id])
  end
end
