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
    elsif user_signed_in? && current_user.email == 'guest@example.com'
      if current_user.status == 'member'
        redirect_to teams_path, notice: 'ゲストユーザー(メンバー)としてログインしました！' 
      else 
        redirect_to mentor_teams_path, notice: 'ゲストユーザー(メンター)としてログインしました！' 
      end
    elsif user_signed_in?
      if current_user.status == 'member'
        redirect_to teams_path, notice: '今日も1日頑張りましょう！' 
      else 
        redirect_to mentor_teams_path, notice: 'メンターとしてログインしました！' 
      end
    end
  end
end
