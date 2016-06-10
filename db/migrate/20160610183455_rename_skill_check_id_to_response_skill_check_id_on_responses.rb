class RenameSkillCheckIdToResponseSkillCheckIdOnResponses < ActiveRecord::Migration
  def change
    rename_column :responses, :skill_check_id, :response_skill_check_id
  end
end
