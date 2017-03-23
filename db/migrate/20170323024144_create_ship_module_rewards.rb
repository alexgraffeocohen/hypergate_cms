class CreateShipModuleRewards < ActiveRecord::Migration
  def change
    create_table :ship_module_rewards do |t|
      t.belongs_to :ship_module, index: true, foreign_key: true, null: false
      t.belongs_to :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
