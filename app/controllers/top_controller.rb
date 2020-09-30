# frozen_string_literal: true

class TopController < ApplicationController
  before_action :login_check, only: [:top]

  def top; end

  def privacy_policy; end

  def terms_of_service; end
  private

  def login_check
    if user_signed_in? && current_user.admin?
      redirect_to admin_users_path, notice: '管理者としてログインしました！'
    elsif user_signed_in?
      redirect_to teams_path, notice: '今日も1日頑張りましょう！' 
    end
  end
end
