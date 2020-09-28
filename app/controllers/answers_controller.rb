# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index; end

  def show
    @comments = Comment.where(answer_id: @answer.id)
    @answer_user = Assign.find_by(user_id: current_user.id, team_id: @answer.team_id)
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to answer_path(id: @answer.id), notice: '更新しました！'

    else
      flash.now[:alert] = '更新に失敗しました！'
      render :edit

    end
  end

  def new
    challenge_start = ChallengeStart.find(params[:challenge_start_id])
    @answer = Answer.new
    @answer.user_id = current_user.id
    @answer.team_id = challenge_start.team.id
    @answer.assign_id = challenge_start.assign.id
    @answer.task_id = challenge_start.task.id
    @answer.challenge_start_id = challenge_start.id
  end

  def create
    challenge_start = ChallengeStart.find(params[:challenge_start_id])
    challenge_course = ChallengeCourse.find_by(course_id: challenge_start.course_id, user_id: current_user.id)
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.team_id = challenge_start.team.id
    @answer.assign_id = challenge_start.assign.id
    @answer.course_id = challenge_start.course.id
    @answer.challenge_course_id = challenge_course.id
    @answer.task_id = challenge_start.task.id
    @answer.challenge_start_id = challenge_start.id

    if @answer.save
      challenge_start.update(status: :awaiting_review)
      redirect_to new_feed_back_path(answer_id: @answer.id), notice: '回答しました。'
    else
      flash.now[:alert] = 'タスク投稿に失敗しました！'
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to teams_path, notice: '回答を削除しました！'
  end

  private

  def answer_params
    params.require(:answer).permit(:url, :content, :image)
  end

  def set_params
    @answer = Answer.find(params[:id])
  end
end
