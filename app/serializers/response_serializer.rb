class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :text

  belongs_to :role
end
