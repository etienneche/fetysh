class AddPhotoToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :photo, :string
  end
end
