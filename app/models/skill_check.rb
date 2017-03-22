class SkillCheck < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :role, :difficulty
  validates_numericality_of :difficulty
  validates_inclusion_of :difficulty, in: %w(3 5 7)
end
