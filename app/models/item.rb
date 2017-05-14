class Item < ActiveRecord::Base
  belongs_to :role
  has_many :events

  validates_presence_of :name, :role
end
