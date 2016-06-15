class CreateRollEffectPairs < ActiveRecord::Migration
  def change
    create_table :roll_effect_pairs do |t|
      t.numrange :roll_range
      t.integer :roll
      t.string :upgrades, array: true
      t.integer :credits
      t.integer :ellerium
      t.integer :wilkinide
      t.integer :galacite
      t.integer :plasma_cells
      t.integer :scrap_metal
      t.integer :medical_supplies
      t.boolean :refugees
      t.references :effect, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :roll_effect_pairs, :upgrades, using: 'gin'
  end
end
