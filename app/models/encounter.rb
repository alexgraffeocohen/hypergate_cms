class Encounter < ActiveRecord::Base
  belongs_to :category
  belongs_to :starting_event, class_name: Event
  has_one :trigger_event, class_name: Event, inverse_of: :next_encounter
  has_many :events

  validates_presence_of :category, :description, :starting_event, :standalone
end
