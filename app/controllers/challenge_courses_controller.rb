class ChallengeCoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge_courses = ChallengeCourse.where(user_id: current_user)
    # .get_ansers(user: current_user).includes(:task).with_challenge_start_title(params[:name]).with_challenge_start_status(params[:status])
  end

  def create
    @challenge = ChallengeStart.create_challenge_start(task: params[:task_id], user: current_user)
    redirect_to task_path(user_id: current_user.id,
                          team_id: @challenge.team.id,
                          assign_id: @challenge.assign.id,
                          id: params[:task_id]),
                notice: 'こちらの課題に取り組みました。'
  end
end
