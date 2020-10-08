class AddQuestionCommentToQuestionColumn < ActiveRecord::Migration[5.2]
  def up
    add_reference :question_comments, :question, foreign_key: true, index: true, null: false, default: 0
  end
end
