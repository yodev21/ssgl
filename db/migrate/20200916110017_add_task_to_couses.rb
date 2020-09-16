class AddTaskToCouses < ActiveRecord::Migration[5.2]
  def change
      add_reference :tasks, :course, foreign_key: true, null: false
  end
end
