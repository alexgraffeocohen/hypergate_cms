class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  def title
    object.encounter.title
  end
end
