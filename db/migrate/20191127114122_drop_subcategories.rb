class DropSubcategories < ActiveRecord::Migration[6.0]
  def change
    drop_table :subcategories
  end
end
