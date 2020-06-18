class AddIndexAssignsToTeamAndUserUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :assigns, column: :team_id
    remove_index :assigns, column: :user_id
    add_index :assigns, [:team_id, :user_id], unique: true
  end
end
