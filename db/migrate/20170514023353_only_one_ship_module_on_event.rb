class OnlyOneShipModuleOnEvent < ActiveRecord::Migration
  def up
    drop_table :ship_module_rewards
    add_belongs_to :events, :ship_module
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
