class CommentsController < ApplicationController

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
        @comments = Comment.where(answer_id: @comment.answer_id)
        format.js { render :index}
      else
        redirect_to team_path , notice: '投稿できませんでした。'
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = "編集中"
      format.js {render :edit }
    end
  end

  def update
    @comment = Comment.find(paramas[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = "コメントが編集されました。"
        format.js { render :index}
      else
        flash.now[:alert] = "コメントの編集に失敗しました。"
        format.js { render :edit_error}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = "コメントが削除されました。"
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
