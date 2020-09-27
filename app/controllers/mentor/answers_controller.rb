class Mentor::AnswersController < ApplicationController
  def index
    @answers = Answer.where(team_id: 
      Assign.where(user_id: current_user.id).select(:team_id)) 
  end
end
