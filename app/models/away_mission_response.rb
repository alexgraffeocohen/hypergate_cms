class AwayMissionResponse < ActiveRecord::Base
  belongs_to :mission
  belongs_to :role
  belongs_to :away_team_mission
end
