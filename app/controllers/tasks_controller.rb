# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @task = Task.find_by(id: params[:id])
    
    @answer = Answer.find_by(user_id: current_user.id, task_id: @task.id)

    @challenge_task = ChallengeStart.find_by(user_id: current_user.id,
                                             task_id: @task.id)
    if @challenge_task
      @question = Question.find_by(user_id: current_user.id,
                                  challenge_start_id: @challenge_task.id)
    end
  end
end
