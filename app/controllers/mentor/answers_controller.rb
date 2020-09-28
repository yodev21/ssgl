class Mentor::AnswersController < ApplicationController
  def index
    @answers = Answer.where(team_id: 
      Assign.where(user_id: current_user.id).select(:team_id)) 
  end

  def show
    @comments = Comment.where(answer_id: @answer.id)
    @answer_user = Assign.find_by(user_id: current_user.id, team_id: @answer.team_id)
  end
  
end
