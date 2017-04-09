class RecreateForeignKeysWithDeleteCascade < ActiveRecord::Migration
  def up
    remove_foreign_key "event_results", "events"
    add_foreign_key "event_results", "events", on_delete: :cascade

    remove_foreign_key "event_results", "ship_effect_results"
    add_foreign_key "event_results", "ship_effect_results", on_delete: :cascade
  end

  def down
    remove_foreign_key "event_results", "events"
    add_foreign_key "event_results", "events"

    remove_foreign_key "event_results", "ship_effect_results"
    add_foreign_key "event_results", "ship_effect_results"
  end
end
