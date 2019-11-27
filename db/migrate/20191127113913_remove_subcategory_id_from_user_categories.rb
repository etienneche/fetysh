class RemoveSubcategoryIdFromUserCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_categories, :subcategory_id
  end
end
