class DeleteImgurlFromArticle < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :img_url
  end
end
