class CreateQuestionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :question_comments do |t|

      t.text :content, null: false
      t.text :image
      t.references :user, foreign_key: true, index: true, null: false
      t.references :team, foreign_key: true, index: true, null: false
      t.references :assign, foreign_key: true, index: true, null: false
      t.references :challenge_start, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
