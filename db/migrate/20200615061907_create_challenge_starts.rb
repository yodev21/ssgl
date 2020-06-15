class CreateChallengeStarts < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_starts do |t|
      t.integer :status, null: false
      t.date :deadline
      t.references :user, foreign_key: true, index: true, null: false
      t.references :team, foreign_key: true, index: true, null: false
      t.references :assign, foreign_key: true, index: true, null: false
      t.references :task, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
