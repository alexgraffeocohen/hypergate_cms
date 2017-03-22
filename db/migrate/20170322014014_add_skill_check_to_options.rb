class AddSkillCheckToOptions < ActiveRecord::Migration
  def change
    add_belongs_to :options, :skill_check, foreign_key: true, index: true
  end
end
