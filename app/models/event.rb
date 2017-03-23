class Event < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :next_encounter, class_name: Encounter, inverse_of: :trigger_event
  has_many :options
  has_many :responses
  has_many :ship_effect_results, through: :event_results
  has_many :event_results
  has_many :items, through: :item_rewards
  has_many :item_rewards
  has_many :ship_modules, through: :ship_module_rewards
  has_many :ship_module_rewards

  validates_presence_of :description, :encounter

  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :options
end
