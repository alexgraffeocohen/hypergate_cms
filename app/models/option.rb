class Option < ActiveRecord::Base
  belongs_to :event
  belongs_to :success_event, class_name: Event, dependent: :destroy
  belongs_to :failure_event, class_name: Event, dependent: :destroy
  belongs_to :required_role, class_name: Role
  belongs_to :skill_check, dependent: :destroy

  validates_associated :success_event, :failure_event
  validates_presence_of :text, :order
  validates_presence_of :success_event, if: :encounter_published?

  accepts_nested_attributes_for :skill_check

  private

  def encounter_published?
    event.encounter.published?
  end
end
