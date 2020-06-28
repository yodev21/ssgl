# frozen_string_literal: true

class CreateFeedBacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_backs do |t|
      t.integer :feeling_numbe, null: false
      t.text :reason
      t.references :user, foreign_key: true, index: true, null: false
      t.references :team, foreign_key: true, index: true, null: false
      t.references :assign, foreign_key: true, index: true, null: false
      t.references :task, foreign_key: true, index: true, null: false
      t.references :challenge_start, foreign_key: true, index: true, null: false
      t.references :answer, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
