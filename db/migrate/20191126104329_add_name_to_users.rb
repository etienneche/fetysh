class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :sex_orientation, :string
    add_column :users, :photo, :string
    add_column :users, :premium, :boolean, default: false
  end
end
