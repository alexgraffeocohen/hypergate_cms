class UpdateOptionsModel < ActiveRecord::Migration
  def change
    change_column_null :options, :text, false
    change_column_null :options, :order, false

    remove_column :options, :encounter_id
    remove_column :options, :result_id
    remove_column :options, :result_type

    add_belongs_to :options, :event, index: true, foreign_key: true, null: false
    add_column :options, :success_event_id, :integer, index: true, null: false
    add_column :options, :failure_event_id, :integer, index: true
    add_column :options, :required_role_id, :integer, index: true

    add_foreign_key :options, :events, column: :success_event_id
    add_foreign_key :options, :events, column: :failure_event_id
    add_foreign_key :options, :roles, column: :required_role_id
  end
end
