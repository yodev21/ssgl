class CoursesController < ApplicationController
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
      redirect_to tasks_path(id: @course.team_id,
                             assign_id: @course.assign_id),
                             notice: 'コースを作成しました！'
    else
      redirect_to tasks_path(id: @course.team_id,
                             assign_id: @course.assign_id),
                             alert: '課題の作成に失敗しました！'
    end 
  end

  def index
    @team = Team.find_by(id: params[:id])
    @assign = Assign.find_by(team_id: @team.id,
                             user_id: current_user.id)
    @courses = Course.belong_to_team_all(team_id: @team.id,
                                       assign_id: @assign.id)
                 .with_title(params[:title])
  end

  def show
    @course = Course.find_by(id: params[:id])

  end

  def edit;end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course), notice: 'コースを更新しました！'
    else
      redirect_to courses_path(@course), notice: 'コースの更新に失敗しました！'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: '課題を削除しました！'
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
