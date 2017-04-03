class RemoveNullConstraintOnSuccessEvent < ActiveRecord::Migration
  def change
    change_column_null :options, :success_event_id, null: true
  end
end
