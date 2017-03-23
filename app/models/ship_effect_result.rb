class ShipEffectResult < ActiveRecord::Base
  belongs_to :ship_effect

  validates_presence_of :ship_effect, :amount
  validates_numericality_of :amount,
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: -3
end
