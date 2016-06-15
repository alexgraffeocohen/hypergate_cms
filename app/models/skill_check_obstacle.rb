class SkillCheckObstacle < ActiveRecord::Base
  belongs_to :mission
  has_many :skill_checks
end
