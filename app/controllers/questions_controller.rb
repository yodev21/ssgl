class QuestionsController < ApplicationController
  before_action :set_params, only: %i[show edit update]
  def index
    @questions = Question.where(team_id: Assign.where(user_id: current_user.id).select(:team_id))
  end

  def show
    @comments = QuestionComment.where(user_id: current_user.id, question_id: @question.id)
  end

  def new
    @question = Question.new
  end

  def create
    challenge_task = ChallengeStart.find(params[:challenge_start_id])
    @question = Question.new(question_params)
    @question.status = :waiting_answer
    @question.user_id = current_user.id
    @question.team_id = challenge_task.team_id
    @question.assign_id = challenge_task.assign_id
    @question.challenge_course_id = challenge_task.challenge_course_id
    @question.challenge_start_id = challenge_task.id
    
    if @question.save
      redirect_to task_path(@question.challenge_start.task_id), notice: '質問しました！'
    else
      render new
    end
  end

  def edit; end

  def update
     if Question.update(question_params)
      redirect_to task_path(@question.challenge_start.task_id), notice: '質問を更新しました！'
     else
      render new
     end
  end
  private
  def question_params
    params.require(:question).permit(:title,:content)
  end

  def set_params
    @question = Question.find(params[:id])
  end
end
