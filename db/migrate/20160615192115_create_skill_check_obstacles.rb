class CreateSkillCheckObstacles < ActiveRecord::Migration
  def change
    create_table :skill_check_obstacles do |t|
      t.integer :order, null: false
      t.text :description, null: false
      t.references :mission, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
