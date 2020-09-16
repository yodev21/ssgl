# frozen_string_literal: true

class CreateAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigns do |t|
      t.integer :status, null: false
      t.references :user, foreign_key: true, index: true, null: false
      t.references :team, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
