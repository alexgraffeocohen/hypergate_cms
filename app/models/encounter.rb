class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses
  has_many :options

  validates_presence_of :category, :description
end
