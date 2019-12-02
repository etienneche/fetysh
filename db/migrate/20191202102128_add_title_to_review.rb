class AddTitleToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :title, :string
  end
end
