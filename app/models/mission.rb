class Mission < ActiveRecord::Base
  has_many :skill_check_obstacles
  has_many :combat_obstacles
  belongs_to :outcome
end
