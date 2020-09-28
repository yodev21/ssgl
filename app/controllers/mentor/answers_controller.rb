class Mentor::AnswersController < ApplicationController
  def index
    binding.pry
    @answers = Answer.mentor_answers_index
  end

  def show
    @comments = Comment.where(answer_id: @answer.id)
    @answer_user = Assign.find_by(user_id: current_user.id, team_id: @answer.team_id)
  end

end
