class ChallengeCoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge_courses = ChallengeCourse.where(user_id: current_user)
    # .get_ansers(user: current_user).includes(:task).with_challenge_start_title(params[:name]).with_challenge_start_status(params[:status])
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
