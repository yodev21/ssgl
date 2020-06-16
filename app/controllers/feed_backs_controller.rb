class FeedBacksController < ApplicationController
  def new
    @answer = Answer.find(params[:answer_id])
    @feed_back = FeedBack.new
  end

  def create
    @feed_back = FeedBack.new(feed_back_params)
    @feed_back.user_id = current_user.id
    @feed_back.team_id = params[:team_id]
    @feed_back.assign_id = params[:assign_id]
    @feed_back.task_id = params[:task_id]
    @feed_back.challenge_start_id = params[:challenge_start_id]
    @feed_back.answer_id = params[:answer_id]

    if @feed_back.save(feed_back_params)
      redirect_to team_assign_task_challenge_start_answer_path(user_id: @feed_back.user_id,
                                                               team_id: @feed_back.team_id,
                                                               assign_id: @feed_back.assign_id,
                                                               task_id: @feed_back.task_id,
                                                               challenge_start_id: @feed_back.challenge_start_id,
                                                               id: @feed_back.answer_id),
                                                               notice: "フィードバックを送信しました。"
    else
      redirect_to team_assign_task_challenge_start_answer_path(user_id: @feed_back.user_id,
                                                               team_id: @feed_back.team_id,
                                                               assign_id: @feed_back.assign_id,
                                                               task_id: @feed_back.task_id,
                                                               challenge_start_id: @feed_back.challenge_start_id,
                                                               id: @feed_back.answer_id),
                                                               alert: "送信に失敗しました。"
    
    end
  end

  def index
    @feed_backs = FeedBack.where(team_id: params[:team_id])
  end

  def show
    @feed_back = FeedBack.find(params[:id])
  end

  private
  def feed_back_params
    params.require(:feed_back).permit(:feeling_number, :reason)
  end
end
