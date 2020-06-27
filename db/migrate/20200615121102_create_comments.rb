# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.text :image
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
