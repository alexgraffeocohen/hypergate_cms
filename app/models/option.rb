class Option < ActiveRecord::Base
  belongs_to :event
  belongs_to :success_event, class_name: Event, dependent: :destroy
  belongs_to :failure_event, class_name: Event, dependent: :destroy
  belongs_to :required_role, class_name: Role
  belongs_to :required_module, class_name: ShipModule
  belongs_to :required_item, class_name: Item
  belongs_to :skill_check, dependent: :destroy

  validates_presence_of :text, :order
end
