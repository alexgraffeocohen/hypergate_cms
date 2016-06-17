class SkillCheck < ActiveRecord::Base
  belongs_to :role
  belongs_to :skill_check_obstacle

  validates_presence_of :description, :role, :skill_check_obstacle
end
