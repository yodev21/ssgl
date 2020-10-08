class Mentor::LimitedReleaseCoursesController < ApplicationController
  def index
    @courses = Course.where(user_id: current_user.id, status: :limited_release)
  end

  def show
    @challenge_courses = ChallengeCourse.includes(:user).where(course_id: params[:id])
    
    @course = Course.find(params[:id])
    sql = "
      SELECT
       DISTINCT users.id,
       users.name,
       users.image,
       users.updated_at
      FROM users
      LEFT JOIN assigns
        ON users.id = assigns.user_id
      WHERE assigns.team_id = :team_id
      AND users.id NOT IN (
        SELECT
          challenge_courses.user_id
        FROM challenge_courses
        WHERE challenge_courses.course_id = :course_id
      )  
      ORDER BY users.id DESC
    "
    @users = User.find_by_sql([sql, {team_id: @course.team_id, course_id: @course.id}])
  end

  def create
    challenge_course = ChallengeCourse.find_by(
      user_id: params[:user_id],
      course_id: params[:course_id]
    )
    if challenge_course
      challenge_course.limited_release_enabled = true
      challenge_course.save
    else
      user = User.find(params[:user_id])
      course = Course.find(params[:course_id])
      assign = Assign.find_by(user_id: user, team_id: course.team.id)
      challenge_course = ChallengeCourse.create!(
        user_id: user.id,
        team_id: assign.team_id,
        assign_id: assign.id,
        course_id: course.id,
        status: :underway,
        limited_release_enabled: true
      )
    end
    redirect_to mentor_limited_release_course_path(challenge_course.course), notice: "限定公開コースに追加しました！"
  end

  def destroy
    challenge_course = ChallengeCourse.find_by(
      user_id: params[:user_id],
      course_id: params[:course_id]
    )
    challenge_course.destroy
    redirect_to mentor_limited_release_course_path(challenge_course.course), notice: "限定公開コースから卒業しました！"
  end
end
