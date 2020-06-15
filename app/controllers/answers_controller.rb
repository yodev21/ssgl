class AnswersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show; end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to team_assign_task_challenge_start_answer_path( team_id: @answer.team_id,
                                                                assign_id: @answer.assign_id,
                                                                task_id: @answer.task_id,
                                                                challenge_start_id: @answer.challenge_start_id,
                                                                id: @answer.id),notice: "更新しました！"
      
    else
      flash.now[:alert] = "更新に失敗しました！"
      render :edit

    end
  end

  def new
    @answer = Answer.new
    @answer.team_id = params[:team_id]
    @answer.assign_id = params[:assign_id]
    @answer.task_id = params[:task_id]
    @answer.challenge_start_id = params[:challenge_start_id]
    @answer.user_id = current_user.id
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.team_id = params[:team_id]
    @answer.assign_id = params[:assign_id]
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
