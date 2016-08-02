class DropSectorAndGridPositionFromEncounters < ActiveRecord::Migration
  def change
    remove_column :encounters, :grid_position, :string, null: false
    remove_column :encounters, :sector, :integer, null: false
  end
end
