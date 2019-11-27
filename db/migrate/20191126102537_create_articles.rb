class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.text :content
      t.string :source
      t.references :user, null: false, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
