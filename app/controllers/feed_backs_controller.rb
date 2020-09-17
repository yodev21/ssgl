# frozen_string_literal: true

class FeedBacksController < ApplicationController
  before_action :authenticate_user!
  def new
    @answer = Answer.find(params[:answer_id])
    @feed_back = FeedBack.new
  end

  def create
    answer = Answer.find(params[:answer_id])
    @feed_back = FeedBack.new(feed_back_params)
    @feed_back.user_id = current_user.id
    @feed_back.team_id = answer.team.id
    @feed_back.assign_id = answer.assign.id
    @feed_back.task_id = answer.task.id
    @feed_back.challenge_start_id = answer.challenge_start.id
    @feed_back.answer_id = answer.id

    if @feed_back.save(feed_back_params)
      redirect_to challenge_start_answer_path(user_id: @feed_back.user_id,
                                              team_id: @feed_back.team_id,
                                              assign_id: @feed_back.assign_id,
                                              task_id: @feed_back.task_id,
                                              challenge_start_id: @feed_back.challenge_start_id,
                                              id: @feed_back.answer_id),
                  notice: 'フィードバックを送信しました。'
    else
      redirect_to challenge_start_answer_path(user_id: @feed_back.user_id,
                                              team_id: @feed_back.team_id,
                                              assign_id: @feed_back.assign_id,
                                              task_id: @feed_back.task_id,
                                              challenge_start_id: @feed_back.challenge_start_id,
                                              id: @feed_back.answer_id),
                  alert: '送信に失敗しました。'

    end
  end

  def index
    @feed_backs = FeedBack.group(:task_id, :team_id).select(:task_id, :team_id)
  end

  def show
    @task = Task.find_by(id: params[:task_id])
    @feed_back_average = FeedBack.group(:task_id).average(:feeling_number)
    @feed_back_count = FeedBack.group(:task_id).count
    @feed_backs = FeedBack.where(task_id: params[:task_id])
  end

  private

  def feed_back_params
    params.require(:feed_back).permit(:feeling_number, :reason)
  end

end
