class EventResult < ActiveRecord::Base
  belongs_to :ship_effect_result, dependent: :destroy
  belongs_to :event

  accepts_nested_attributes_for :ship_effect_result
end
