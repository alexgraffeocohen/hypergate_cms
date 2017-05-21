class Event < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :next_encounter, class_name: Encounter, inverse_of: :trigger_event
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :event_results, inverse_of: :event, dependent: :destroy
  belongs_to :item
  belongs_to :ship_module
  belongs_to :item_role_requirement, class_name: Role
  belongs_to :ship_module_role_requirement, class_name: Role

  validates_associated :options
  validates_presence_of :description, :encounter
  validate :next_encounter_is_not_event_encounter
  validates :item,
    presence: {
    if: :item_role_requirement,
    message: "Must have an item reward to require a role for that item."
  }
  validates :ship_module,
    presence: {
    if: :ship_module_role_requirement,
    message: "Must have a ship module reward to require a role for that ship module."
  }

  accepts_nested_attributes_for :responses, :event_results

  private

  def next_encounter_is_not_event_encounter
    if next_encounter == encounter
      errors.add(:next_encounter, "Can't select this event's encounter as the next encounter.")
    end
  end
end
