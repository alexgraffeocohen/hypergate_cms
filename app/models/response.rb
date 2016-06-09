class Response < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :role
end
