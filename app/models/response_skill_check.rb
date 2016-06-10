class ResponseSkillCheck < ActiveRecord::Base
  belongs_to :response
  belongs_to :result
end
