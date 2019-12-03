class AddOrganizerToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :organizer, :string
  end
end
