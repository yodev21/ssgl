class Mentor::QuestionsController < ApplicationController
  before_action :set_params, only: %i[show create]
  def index
    if params[:wating].nil?
      @questions = Question.where(task_id: params[:task_id])
    else
      @questions = Question.where(team_id: current_user.teams.select(:team_id)).where(status: :waiting_answer)
    end
  end

  def show
    @comments = QuestionComment.where(question_id: @question.id)
  end

  def create
    @question.update(status: 'solved')
    redirect_to mentor_question_path(@question), notice: '解決済みになりました！'
  end

  private
  def set_params
    @question = Question.find(params[:id])
  end
end
