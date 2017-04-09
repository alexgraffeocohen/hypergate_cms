class EventResult < ActiveRecord::Base
  belongs_to :ship_effect_result, dependent: :destroy
  belongs_to :event
end
