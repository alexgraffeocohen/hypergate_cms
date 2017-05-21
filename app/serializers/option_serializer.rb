class OptionSerializer < ActiveModel::Serializer
  attributes :id, :text, :order

  belongs_to :success_event
  belongs_to :failure_event
end