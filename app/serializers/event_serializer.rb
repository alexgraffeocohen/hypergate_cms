class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  belongs_to :ship_module, key: :ship_module_reward
  has_many :options

  def title
    object.encounter.title
  end
end
