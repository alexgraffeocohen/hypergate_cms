class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses
  has_many :credits
  has_many :wilkinide
  has_many :galacite
  has_many :ellerium
  has_many :scrap_metal
  has_many :plasma_cells
  has_many :medical_supplies
  has_many :refugee_groups
end
