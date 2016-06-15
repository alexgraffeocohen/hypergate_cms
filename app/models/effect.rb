class Effect < ActiveRecord::Base
  belongs_to :outcome
  has_many :roll_effect_pairs
end
