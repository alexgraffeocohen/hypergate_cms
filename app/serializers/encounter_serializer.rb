class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :description, :standalone, :title
end
