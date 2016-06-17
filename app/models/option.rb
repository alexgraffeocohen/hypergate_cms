class Option < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :result, polymorphic: true
  has_one :requirement

  validates_presence_of :encounter, :text, :order, :result_id, :result_type
end
