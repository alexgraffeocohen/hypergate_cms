class ShipModule < ActiveRecord::Base
  belongs_to :role
  has_many :events, through: :ship_module_rewards
  has_many :ship_module_rewards

  validates_presence_of :name, :role
end
