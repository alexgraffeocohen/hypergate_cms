class ModifyResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :encounter_id, :integer
    add_belongs_to :responses, :event, foreign_key: true, null: false
    add_foreign_key :responses, :roles, column: :role_id
    change_column_null :responses, :text, false
    change_column_null :responses, :role_id, false
    add_index :responses, :role_id
  end
end
