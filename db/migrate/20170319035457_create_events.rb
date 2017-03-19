class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description, null: false
      t.references :encounter, index: true, foreign_key: true, null: false
      t.integer :next_encounter_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :events, :encounters, column: :next_encounter_id
  end
end
