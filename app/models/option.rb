class Option < ActiveRecord::Base
  belongs_to :encounter
  has_one :result
end
