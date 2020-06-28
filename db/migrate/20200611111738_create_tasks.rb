# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :image, null: false
      t.references :user, foreign_key: true, index: true, null: false
      t.references :team, foreign_key: true, index: true, null: false
      t.references :assign, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
