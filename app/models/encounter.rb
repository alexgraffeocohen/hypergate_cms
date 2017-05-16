class Encounter < ActiveRecord::Base
  belongs_to :category
  belongs_to :starting_event, class_name: Event
  has_one :trigger_event, class_name: Event, inverse_of: :next_encounter
  has_many :events, dependent: :destroy

  validates_presence_of :category, :description, :standalone
  validates_presence_of :starting_event, if: :published

  validates_associated :starting_event
end
