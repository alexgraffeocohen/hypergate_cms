class Option < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :result, polymorphic: true
end
