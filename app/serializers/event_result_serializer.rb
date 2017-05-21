class EventResultSerializer < ActiveModel::Serializer
  attributes :id, :amount

  belongs_to :ship_effect
end
