class Event < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :next_encounter, class_name: Encounter, inverse_of: :trigger_event
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy
  # The records which get deleted are the join records, rather than the
  # associated records. ShipEffectResult only gets deleted in this case because
  # I marked the belongs_to on EventResult with dependent: :destroy.
  # See: http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  has_many :ship_effect_results, through: :event_results, dependent: :destroy
  has_many :event_results
  # The records which get deleted are the join records, rather than the
  # associated records.
  # See: http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  has_many :items, through: :item_rewards, dependent: :destroy
  has_many :item_rewards
  # The records which get deleted are the join records, rather than the
  # associated records.
  # See: http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many
  has_many :ship_modules, through: :ship_module_rewards, dependent: :destroy
  has_many :ship_module_rewards

  validates_presence_of :description, :encounter

  accepts_nested_attributes_for :responses
end
