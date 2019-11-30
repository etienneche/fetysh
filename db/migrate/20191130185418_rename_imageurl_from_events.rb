class RenameImageurlFromEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :img_url, :photo
  end
end
