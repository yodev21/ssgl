class Mentor::LimitedReleaseCoursesController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id, status: :limited_release)
  end

  def show
    @course = Course.find(params[:id])
    @users = User.includes(:assigns)
    
  end

  def create

  end
end
