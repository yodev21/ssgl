class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @courses = Course.where(status: "release").order(updated_at: :desc)
  end

  def show
    @course = Course.find_by(id: params[:id])
    @challenge_course = ChallengeCourse.find_by(user_id: current_user.id, course_id: @course)
    @tasks = Task.where(course_id: @course.id)
  end
end
