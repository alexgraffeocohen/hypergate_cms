class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses

  validates_presence_of :category, :description
end
