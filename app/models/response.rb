class Response < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :role
  has_one :response_skill_check
end
