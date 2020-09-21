class CoursesController < ApplicationController
  before_action :set_params, only: %i[edit update destroy]
  before_action :authenticate_user!
  
  def index
    @courses = Course.order(updated_at: :desc)
  end

  def show
    @course = Course.find_by(id: params[:id])
    @challenge_course = ChallengeCourse.find_by(user_id: current_user.id, course_id: @course)
    @tasks = Task.where(course_id: @course.id)

  end

  # def edit;end

  # def update
  #   if @course.update(course_params)
  #     redirect_to course_path(@course), notice: 'コースを更新しました！'
  #   else
  #     redirect_to courses_path(@course), notice: 'コースの更新に失敗しました！'
  #   end
  # end

  # def destroy
  #   @course.destroy
  #   redirect_to courses_path, notice: '課題を削除しました！'
  # end

  private

  # def course_params
  #   params.require(:course).permit(:title,
  #                                   :content,
  #                                   :image)
  # end

  def set_params
    @course = Course.find_by(id: params[:id])
  end
end
