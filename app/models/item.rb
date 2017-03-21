class Item < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :name, :role
end
