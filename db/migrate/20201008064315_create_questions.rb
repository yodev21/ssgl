class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :image
      t.integer :status, null: false

      t.references :user, foreign_key: true, index: true, null: false
      t.references :assign, foreign_key: true, index: true, null: false
      t.references :challenge_course, foreign_key: true, index: true, null: false
      t.references :challenge_start, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
