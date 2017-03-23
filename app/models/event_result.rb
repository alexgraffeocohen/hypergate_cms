class EventResult < ActiveRecord::Base
  belongs_to :ship_effect_result
  belongs_to :event
end
