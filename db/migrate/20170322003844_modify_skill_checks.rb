class ModifySkillChecks < ActiveRecord::Migration
  def change
    remove_column :skill_checks, :skill_check_obstacle_id
    add_column :skill_checks, :difficulty, :integer, null: false
    change_column_null :skill_checks, :description, true
  end
end
