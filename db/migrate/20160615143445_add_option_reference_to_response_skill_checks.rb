class AddOptionReferenceToResponseSkillChecks < ActiveRecord::Migration
  def change
    add_reference :response_skill_checks, :option, index: true, null: false, foreign_key: true
  end
end
