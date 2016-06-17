class CombatObstacle < ActiveRecord::Base
  belongs_to :mission
  validates :enemy_count, numericality: { greater_than: 0, less_than_or_equal_to: 3 }, presence: true
  validates :order, numericality: { greater_than: 0, less_than_or_equal_to: 3 }, presence: true
  validates_presence_of :mission, :description
end
