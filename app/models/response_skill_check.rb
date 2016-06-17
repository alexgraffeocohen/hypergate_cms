class ResponseSkillCheck < ActiveRecord::Base
  belongs_to :response
  belongs_to :option

  validates_presence_of :response, :option
end
