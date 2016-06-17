class DropResultIdFromResponseSkillChecks < ActiveRecord::Migration
  def change
    remove_column :response_skill_checks, :result_id, :integer, null: false
  end
end
