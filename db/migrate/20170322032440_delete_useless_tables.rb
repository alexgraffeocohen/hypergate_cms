class DeleteUselessTables < ActiveRecord::Migration
  def change
    drop_table :away_mission_responses
    drop_table :roll_effect_pairs
    drop_table :skill_check_obstacles
    drop_table :effects
    drop_table :away_missions
    drop_table :requirements
    drop_table :combat_obstacles
    drop_table :missions
    drop_table :outcomes
  end
end
