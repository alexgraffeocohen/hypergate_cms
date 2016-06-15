class CombatObstacle < ActiveRecord::Base
  belongs_to :mission
  validates_numericality_of :enemy_count, greater_than: 0
  validates_numericality_of :order, greater_than: 0
end
