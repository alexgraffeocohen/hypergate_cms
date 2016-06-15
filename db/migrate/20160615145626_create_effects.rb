class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.boolean :base_effect, null: false, default: true
      t.boolean :mining_bay, null: false, default: false
      t.boolean :cargo_bay, null: false, default: false
      t.boolean :repair_bay, null: false, default: false
      t.boolean :battery, null: false, default: false
      t.boolean :defense_droid, null: false, default: false
      t.boolean :astrometrics, null: false, default: false
      t.boolean :ship_computer, null: false, default: false
      t.references :outcome, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
