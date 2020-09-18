class AddPriorityNoToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority_no, :integer, null: false, default: 0
  end
end
