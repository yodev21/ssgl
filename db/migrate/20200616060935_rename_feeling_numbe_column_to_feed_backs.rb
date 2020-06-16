class RenameFeelingNumbeColumnToFeedBacks < ActiveRecord::Migration[5.2]
  def change
    rename_column :feed_backs, :feeling_numbe, :feeling_number
  end
end
