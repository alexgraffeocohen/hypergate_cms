class CreateResponseSkillChecks < ActiveRecord::Migration
  def change
    create_table :response_skill_checks do |t|
      t.text :success_text
      t.text :failure_text
      t.integer :result_id, null: false
      t.integer :response_id, null: false

      t.timestamps null: false
    end
  end
end
