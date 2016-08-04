class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses
  has_many :options

  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :options

  validates_presence_of :category, :description
end
