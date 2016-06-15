class RemoveAllTheRewardTables < ActiveRecord::Migration
  def up
    drop_table :credits
    drop_table :ellerium
    drop_table :wilkinide
    drop_table :galacite
    drop_table :plasma_cells
    drop_table :scrap_metal
    drop_table :medical_supplies
    drop_table :refugee_groups
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
