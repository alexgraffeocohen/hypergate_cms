class RemoveNullContstraintFromStartingEventIdInEncounters < ActiveRecord::Migration
  def change
    change_column_null :encounters, :starting_event_id, null: true
  end
end
