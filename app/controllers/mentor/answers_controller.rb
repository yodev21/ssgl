class Mentor::AnswersController < ApplicationController
  def index
    @users = Mentor::User.mentor_answers_index(current_user.id)
    binding.pry
  end

  def show
    @comments = Comment.where(answer_id: @answer.id)
    @answer_user = Assign.find_by(user_id: current_user.id, team_id: @answer.team_id)
  end

end
