class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.date :date
      t.decimal :price
      t.string :img_url
      t.references :category, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
