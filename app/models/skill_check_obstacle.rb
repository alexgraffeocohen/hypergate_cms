class SkillCheckObstacle < ActiveRecord::Base
  belongs_to :mission
  has_many :skill_checks
  validates_numericality_of :order, greater_than: 0
end
