# frozen_string_literal: true

class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :image, :text
  end
end
