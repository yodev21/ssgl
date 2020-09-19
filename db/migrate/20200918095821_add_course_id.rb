class AddCourseId < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :course, foreign_key: true, index: true, null: false, default: 0
    add_reference :challenge_starts, :course, foreign_key: true, index: true, null: false, default: 0
    add_reference :answers, :course, foreign_key: true, index: true, null: false, default: 0
    add_reference :feed_backs, :course, foreign_key: true, index: true, null: false, default: 0
    add_reference :comments, :course, foreign_key: true, index: true, null: false, default: 0
  end
end
