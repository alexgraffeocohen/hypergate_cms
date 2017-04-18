class Response < ActiveRecord::Base
  belongs_to :event
  belongs_to :role
  has_one :response_skill_check, dependent: :destroy

  validates_presence_of :text, :role
end
