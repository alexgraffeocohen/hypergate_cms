class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  belongs_to :ship_module, key: :ship_module_reward

  def title
    object.encounter.title
  end
end
