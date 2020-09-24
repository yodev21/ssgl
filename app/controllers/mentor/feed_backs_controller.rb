class Mentor::FeedBacksController < ApplicationController
  def index
    @feed_backs = FeedBack.where(course_id: params[:course_id]).group(:task_id, :team_id, :course_id).select(:task_id, :team_id, :course_id)
    
  end

  def show
    @task = Task.find_by(id: params[:task_id])
    @feed_back_average = FeedBack.group(:task_id).average(:feeling_number)
    @feed_back_count = FeedBack.group(:task_id).count
    @feed_backs = FeedBack.where(task_id: params[:task_id])
  end
end
