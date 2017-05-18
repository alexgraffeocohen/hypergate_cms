class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :description, :standalone, :title

  belongs_to :category
  belongs_to :starting_event
end
