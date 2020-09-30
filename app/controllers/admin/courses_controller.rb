class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: %i[show destroy]
  def index
    @courses = Course.order(updated_at: :desc)
  end

  def show
    @tasks = Task.where(course_id: @course.id).order(updated_at: :asc)
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path, notice: "削除しました！"
  end

  def set_params
    @course = Course.find(params[:id])
  end
end
