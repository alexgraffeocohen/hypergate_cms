class CreateSkillChecks < ActiveRecord::Migration
  def change
    create_table :skill_checks do |t|
      t.references :role, index: true, foreign_key: true, null: false
      t.references :skill_check_obstacle, index: true, foreign_key: true, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
