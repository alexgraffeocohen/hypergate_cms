class CreateShipEffects < ActiveRecord::Migration
  def change
    create_table :ship_effects do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
