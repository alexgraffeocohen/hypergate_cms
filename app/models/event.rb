class Event < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :next_encounter, class_name: Encounter, inverse_of: :trigger_event
  has_many :options
  has_many :responses

  validates_presence_of :description, :encounter

  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :options
end
