class RemoveNullConstraintsFromResponse < ActiveRecord::Migration
  def change
    change_column :responses, :encounter_id, :integer, null: true
    change_column :responses, :text, :string, null: true
    change_column :responses, :role_id, :integer, null: true
  end
end
