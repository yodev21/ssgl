class ChallengeCoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = ChallengeCourse.where(user_id: current_user)
  end

  def show
    @challenge_course = ChallengeCourse.find(params[:id])
    @tasks = Task.where(challenge_course_id: @challenge_course.course.id)
  end

  def create
    course = Course.find(params[:course_id])
    @challenge_course = ChallengeCourse.create(
      user_id: current_user.id,
      team_id: course.team.id,
      assign_id: course.assign.id,
      course_id: course.id,
      status: :underway
    )
    redirect_to challenge_course_path(@challenge_course), notice: 'こちらのコースに取り組みました。'
  end
end
