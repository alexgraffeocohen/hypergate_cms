class DropResponseSkillCheckIdFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :response_skill_check_id, :integer
  end
end
