class Requirement < ActiveRecord::Base
  belongs_to :option

  validates_presence_of :option
end
