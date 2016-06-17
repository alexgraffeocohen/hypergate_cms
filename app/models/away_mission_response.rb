class AwayMissionResponse < ActiveRecord::Base
  belongs_to :mission
  belongs_to :role
  belongs_to :away_mission

  validates_presence_of :role, :away_mission, :response
end
