class CreateShipModules < ActiveRecord::Migration
  def change
    create_table :ship_modules do |t|
      t.string :name, null: false
      t.boolean :starting_module, null: false, default: false
      t.references :role, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
