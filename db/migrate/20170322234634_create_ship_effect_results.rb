class CreateShipEffectResults < ActiveRecord::Migration
  def change
    create_table :ship_effect_results do |t|
      t.references :ship_effect, index: true, foreign_key: true, null: false
      t.integer :amount, null: false

      t.timestamps null: false
    end
  end
end
