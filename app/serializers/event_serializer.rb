class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  belongs_to :ship_module, key: :ship_module_reward
  belongs_to :item, key: :item_reward
  belongs_to :item_role_requirement
  belongs_to :ship_module_role_requirement
  belongs_to :next_encounter
  has_many :options
  has_many :responses
  has_many :event_results, key: :results do
    object.event_results.where.not(amount: 0)
  end

  def title
    object.encounter.title
  end
end
