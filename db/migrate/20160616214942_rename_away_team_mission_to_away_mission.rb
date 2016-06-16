class RenameAwayTeamMissionToAwayMission < ActiveRecord::Migration
  def change
    remove_foreign_key :away_mission_responses, :away_team_missions
    rename_table :away_team_missions, :away_missions
    rename_column :away_mission_responses, :away_team_mission_id, :away_mission_id
    add_foreign_key :away_mission_responses, :away_missions
  end
end
