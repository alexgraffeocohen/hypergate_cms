class CreateCombatObstacles < ActiveRecord::Migration
  def change
    create_table :combat_obstacles do |t|
      t.references :mission, index: true, foreign_key: true, null: false
      t.text :description, null: false
      t.integer :enemy_count, null: false, default: 1
      t.integer :order, null: false, default: 1

      t.timestamps null: false
    end
  end
end
