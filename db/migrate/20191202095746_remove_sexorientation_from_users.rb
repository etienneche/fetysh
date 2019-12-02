class RemoveSexorientationFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :sex_orientation
    remove_column :users, :premium
    remove_column :users, :gender
  end
end
