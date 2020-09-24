class Mentor::LimitedReleaseCoursesController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id, status: :limited_release)
  end

  def show
  end

  def create

  end
end
