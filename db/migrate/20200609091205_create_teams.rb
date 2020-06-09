class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.text :image, null: false
      t.text :remarks
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
