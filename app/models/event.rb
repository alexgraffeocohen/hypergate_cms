class Event < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :next_encounter, class_name: Encounter, inverse_of: :trigger_event
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :event_results, inverse_of: :event, dependent: :destroy
  belongs_to :item
  belongs_to :ship_module

  validates_presence_of :description, :encounter

  accepts_nested_attributes_for :responses, :event_results
end
