class AddChallengeCourseId < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :challenge_course, foreign_key: true, index: true, null: false, default: 0
    add_reference :challenge_starts, :challenge_course, foreign_key: true, index: true, null: false, default: 0
    add_reference :answers, :challenge_course, foreign_key: true, index: true, null: false, default: 0
    add_reference :feed_backs, :challenge_course, foreign_key: true, index: true, null: false, default: 0
    add_reference :comments, :challenge_course, foreign_key: true, index: true, null: false, default: 0
  end
end
