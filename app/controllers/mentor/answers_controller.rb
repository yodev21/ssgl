class Mentor::AnswersController < ApplicationController
  def index
    @users = User.mentor_users_answer(current_user.id)
  end

  def show
    @answer = Answer.includes([:user, :task]).find(params[:id])
    @comments = Comment.where(answer_id: params[:id])
  end

end
