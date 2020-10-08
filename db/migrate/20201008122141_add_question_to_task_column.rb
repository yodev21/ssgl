class AddQuestionToTaskColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :task, foreign_key: true, index: true, null: false, default: 0
  end
end
