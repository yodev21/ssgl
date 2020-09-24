class AddCourseToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :status, :integer, null: false, default: 0
  end
end
