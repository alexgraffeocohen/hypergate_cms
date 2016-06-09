class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :text, null: false
      t.integer :role_id, null: false
      t.integer :skill_check_id
      t.integer :encounter_id, null: false

      t.timestamps null: false
    end
  end
end
