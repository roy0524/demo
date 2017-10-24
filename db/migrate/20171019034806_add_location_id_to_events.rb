class AddLocationIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location_id, :string
  end
end
