class AnswersController < ApplicationController
  def index
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    binding.irb
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @answer.assign_id = params[:assign_id]
    @answer.team_id = params[:team_id]
    @answer.task_id = params[:task_id]
    @answer.challenge_start_id = params[:challenge_start_id]
    @answer.user_id = current_user.id
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.assign_id = params[:assign_id]
    @answer.team_id = params[:team_id]
    @answer.task_id = params[:task_id]
    @answer.challenge_start_id = params[:challenge_start_id]
    @answer.user_id = current_user.id

    if @answer.save
       ChallengeStart.update(status: :awaiting_review)
      redirect_to team_assign_task_challenge_start_answer_path( team_id: @answer.team_id,
                                                                assign_id: @answer.assign_id,
                                                                task_id: @answer.task_id,
                                                                challenge_start_id: @answer.challenge_start_id,
                                                                id: @answer.id),notice: "回答しました！"
    else
      flash.now[:alert] = "課題投稿に失敗しました！"
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:url, :content, :image)
  end
end
