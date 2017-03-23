class CreateEventResults < ActiveRecord::Migration
  def change
    create_table :event_results do |t|
      t.belongs_to :ship_effect_result, index: true, foreign_key: true, null: false
      t.belongs_to :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
