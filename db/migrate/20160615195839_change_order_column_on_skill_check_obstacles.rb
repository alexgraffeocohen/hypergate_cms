class ChangeOrderColumnOnSkillCheckObstacles < ActiveRecord::Migration
  def up
    change_column_default :skill_check_obstacles, :order, 1
  end

  def down
    change_column_default :skill_check_obstacles, :order, nil
  end
end
