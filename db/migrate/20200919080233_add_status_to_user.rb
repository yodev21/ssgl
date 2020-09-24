class AddStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :integer, null: false, default: 0
  end
end
