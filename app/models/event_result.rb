class EventResult < ActiveRecord::Base
  belongs_to :event
  belongs_to :ship_effect

  validates_presence_of :amount
  validates_numericality_of :amount,
    less_than_or_equal_to: 3,
    greater_than_or_equal_to: -3
end
