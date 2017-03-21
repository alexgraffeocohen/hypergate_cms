class Option < ActiveRecord::Base
  belongs_to :event
  belongs_to :success_event, class_name: Event
  belongs_to :failure_event, class_name: Event
  belongs_to :required_role, class_name: Role

  validates_presence_of :text, :order
end
