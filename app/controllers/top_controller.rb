class TopController < ApplicationController
  before_action :login_check

  def top
  end

  private
  def login_check
    if user_signed_in?
      redirect_to teams_path, notice: "ログインしています。"
    end
  end
end
