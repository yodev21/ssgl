class Mentor::CoursesController < ApplicationController
  before_action :set_params, only: %i[edit update destroy]
  before_action :authenticate_user!
  
  def new
    @course = Course.new
  end

  def create
    @assign = Assign.find_by(id: params[:assign_id])
    @course = @assign.courses.build(course_params)
    @course.user_id = current_user.id
    @course.team_id = @assign.team_id
    if @course.save
      @challenge_course = ChallengeCourse.create!(
        status: 0,
        user_id: current_user.id,
        team_id: @course.team.id,
        assign_id: @course.assign_id,
        course_id: @course.id
      )
      redirect_to new_mentor_task_path(challenge_course_id: @challenge_course), notice: 'コースを作成しました！ 次にタスクを作成しましょう！'
    else
      redirect_to tasks_path(id: @course.team_id,
                             assign_id: @course.assign_id),
                             alert: '課題の作成に失敗しました！'
    end 
  end

  def index
    @courses = Course.order(updated_at: :desc)
  end

  def show
    @course = Course.find_by(id: params[:id])
    @challenge_course = ChallengeCourse.find_by(user_id: current_user.id, course_id: @course)
    @tasks = Task.where(course_id: @course.id)
  end

  def edit;end

  def update
    if @course.update(course_params)
      redirect_to mentor_course_path(@course), notice: 'コースを更新しました！'
    else
      redirect_to mentor_courses_path(@course), notice: 'コースの更新に失敗しました！'
    end
  end

  def destroy
    @course.destroy
    redirect_to mentor_courses_path, notice: '課題を削除しました！'
  end

  private

  def course_params
    params.require(:course).permit(:title,
                                    :content,
                                    :image)
  end

  def set_params
    @course = Course.find_by(id: params[:id])
  end
end