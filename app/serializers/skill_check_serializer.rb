class SkillCheckSerializer < ActiveModel::Serializer
  attributes :id, :description, :difficulty

  belongs_to :role
end
