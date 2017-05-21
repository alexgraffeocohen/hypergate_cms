class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :next_encounter_id

  belongs_to :ship_module, key: :ship_module_reward
  belongs_to :item, key: :item_reward
  has_many :options
  has_many :responses
  has_many :event_results, key: :results

  def title
    object.encounter.title
  end
end
