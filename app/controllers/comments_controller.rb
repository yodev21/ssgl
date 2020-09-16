# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.team_id = params[:team_id]
    @comment.assign_id = params[:assign_id]
    @comment.task_id = params[:task_id]
    @comment.challenge_start_id = params[:challenge_start_id]
    @comment.answer_id = params[:answer_id]
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        send_user(@comment)
        change_status(@comment)
        @comments = Comment.where(answer_id: @comment.answer_id)
        format.js { render :index }
      else
        redirect_to team_path, notice: '投稿できませんでした。'
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました。'
        format.js { render :index }
      else
        flash.now[:alert] = 'コメントの編集に失敗しました。'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comments = Comment.where(answer_id: @comment.answer_id)
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = 'コメントが削除されました。'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image)
  end

  def send_user(comment)
    if current_user.id == comment.answer.user_id
      comment.team.assigns.each do |assign|
        CommentMailer.comment_mail(assign.user.email).deliver if assign.status == 'admin' || assign.status == 'memtor'
      end
    else
      CommentMailer.comment_mail(comment.answer.user.email).deliver
    end
  end

  def change_status(comment)
    # comment_user = ChallengeStart.find(comment.challenge_start_id)
    challenge_start_id = ChallengeStart.find(comment.challenge_start_id)
    comment_user = Assign.find_by(user_id: comment.user_id,
                                         team_id: comment.team_id)

    # if current_user.id == comment.answer.user_id
    if comment_user.status == "admin" || comment_user.status == "memtor"
      challenge_start_id.update(status: 'remand')
    else
      challenge_start_id.update(status: 'awaiting_review')
    end
  end
end
