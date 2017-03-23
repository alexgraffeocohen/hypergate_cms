class Item < ActiveRecord::Base
  belongs_to :role
  has_many :events, through: :item_rewards
  has_many :item_rewards

  validates_presence_of :name, :role
end
