class QuestionCommentsController < ApplicationController
  before_action :authenticate_user!

  def create

    @question = Question.find(params[:question_id])
    if params[:solved] == 'solved'
      solved
      redirect_to question_path(@question), notice: '解決済みになりました！'
    else
      
      @comment = QuestionComment.new(comment_params)
      @comment.user_id = current_user.id
      @comment.team_id = @question.team_id
      @comment.assign_id = @question.assign_id
      @comment.challenge_start_id = @question.challenge_start_id
      @comment.question_id = @question.id

      respond_to do |format|
        if @comment.save
          change_status(@comment)
          @comments = QuestionComment.where(user_id: current_user.id, question_id: @question.id)
          format.js { render :index }
        else
          redirect_to team_path, notice: '投稿できませんでした。'
        end
      end
    end
  end

  def edit
    @comment = QuestionComment.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = QuestionComment.find(params[:id])
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
    @comment = QuestionComment.find(params[:id])
    @comments = QuestionComment.where(answer_id: @comment.answer_id)
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = 'コメントが削除されました。'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.permit(:content, :image)
  end

  def change_status(comment)
    comment_user = Assign.find_by(user_id: comment.user_id,
                                         team_id: comment.team_id)
                                         
    if current_user.status == "mentor" && comment_user.status == "admin" || comment_user.status == "mentor"
      @question.update(status: 'temporary_answer')
    else
      @question.update(status: 'waiting_answer')
    end
  end

  def solved
    @question.update(status: 'solved')
  end
end
