class SkillCheckObstacle < ActiveRecord::Base
  belongs_to :mission
  has_many :skill_checks

  validates :order, numericality: { greater_than: 0, less_than_or_equal_to: 3 }, presence: true
  validates_presence_of :description, :mission
end
