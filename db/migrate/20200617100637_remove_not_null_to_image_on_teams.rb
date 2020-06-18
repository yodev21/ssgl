class RemoveNotNullToImageOnTeams < ActiveRecord::Migration[5.2]
  def up
    change_column :teams, :image, :text, null: true
  end

  def down
    change_column :teams, :image, :text, null: false
  end
end
