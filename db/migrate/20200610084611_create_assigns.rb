class CreateAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigns do |t|

      t.timestamps
    end
  end
end
