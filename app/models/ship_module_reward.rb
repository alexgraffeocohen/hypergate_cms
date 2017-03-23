class ShipModuleReward < ActiveRecord::Base
  belongs_to :ship_module
  belongs_to :event
end
