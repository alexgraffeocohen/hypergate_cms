class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses
  has_many :options
  has_one :trigger_event, class_name: Event, inverse_of: :next_encounter

  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :options

  validates_presence_of :category, :description
end
