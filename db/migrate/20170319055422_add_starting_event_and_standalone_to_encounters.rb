class AddStartingEventAndStandaloneToEncounters < ActiveRecord::Migration
  def change
    add_column :encounters, :starting_event_id, :integer, null: false, index: true
    add_column :encounters, :standalone, :boolean, null: false, default: true

    add_foreign_key :encounters, :events, column: :starting_event_id
  end
end
