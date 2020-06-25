class TopController < ApplicationController
  before_action :login_check

  def top
    binding.pry
  end

  private
  def login_check
    if user_signed_in?
      redirect_to teams_path, notice: "今日も1日頑張りましょう！"
    end
  end
end
