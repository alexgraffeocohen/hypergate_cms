class RemoveShipEffectResults < ActiveRecord::Migration
  def up
    remove_foreign_key "event_results", "ship_effect_results"
    remove_foreign_key "ship_effect_results", "ship_effects"

    drop_table :ship_effect_results
    remove_column :event_results, :ship_effect_result_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
