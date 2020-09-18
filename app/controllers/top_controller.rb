# frozen_string_literal: true

class TopController < ApplicationController
  # before_action :login_check, only: [:top]

  def top; end

  def privacy_policy; end

  def terms_of_service; end
  private

  def login_check
    redirect_to teams_path, notice: '今日も1日頑張りましょう！' if user_signed_in?
  end
end
