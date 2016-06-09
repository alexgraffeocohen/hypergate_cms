class Encounter < ActiveRecord::Base
  belongs_to :category
  has_many :responses
end
