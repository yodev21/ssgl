# frozen_string_literal: true

class FeedBacksController < ApplicationController
  before_action :authenticate_user!
  def new
    @answer = Answer.find(params[:answer_id])
    @feed_back = FeedBack.new
  end

  def create
    answer = Answer.find(params[:feed_back][:answer_id])
    @feed_back = FeedBack.new(feed_back_params)
    @feed_back.user_id = current_user.id
    @feed_back.team_id = answer.team.id
    @feed_back.assign_id = answer.assign.id
    @feed_back.course_id = answer.course.id
    @feed_back.challenge_course_id = answer.id
    @feed_back.task_id = answer.task.id
    @feed_back.challenge_start_id = answer.challenge_start.id
    @feed_back.answer_id = answer.id

    if @feed_back.save(feed_back_params)
      redirect_to answer_path(id: @feed_back.answer_id),notice: 'フィードバックを送信しました。'
    else
      redirect_to answer_path(user_id: @feed_back.user_id,
                              team_id: @feed_back.team_id,
                              assign_id: @feed_back.assign_id,
                              task_id: @feed_back.task_id,
                              challenge_start_id: @feed_back.challenge_start_id,
                              id: @feed_back.answer_id),
                  alert: '送信に失敗しました。'

    end
  end

  private

  def feed_back_params
    params.require(:feed_back).permit(:feeling_number, :reason)
  end

end
