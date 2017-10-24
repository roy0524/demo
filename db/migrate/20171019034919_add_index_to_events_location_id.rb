class AddIndexToEventsLocationId < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :location_id
  end
end
