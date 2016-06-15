class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :credits, null: false, default: 0
      t.integer :ellerium, null: false, default: 0
      t.integer :wilkinide, null: false, default: 0
      t.integer :galacite, null: false, default: 0
      t.integer :plasma_cells, null: false, default: 0
      t.integer :scrap_metal, null: false, default: 0
      t.integer :medical_supplies, null: false, default: 0
      t.boolean :refugees, null: false, default: false
      t.references :option, index: true, foreign_key: true, null: false
      t.boolean :mining_bay, null: false, default: false
      t.boolean :cargo_bay, null: false, default: false
      t.boolean :repair_bay, null: false, default: false
      t.boolean :battery, null: false, default: false
      t.boolean :defense_droid, null: false, default: false
      t.boolean :astrometrics, null: false, default: false
      t.boolean :ship_computer, null: false, default: false

      t.timestamps null: false
    end
  end
end
