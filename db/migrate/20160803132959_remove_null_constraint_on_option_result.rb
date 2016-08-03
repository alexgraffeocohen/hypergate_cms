class RemoveNullConstraintOnOptionResult < ActiveRecord::Migration
  def change
    change_column :options, :result_id, :integer, null: true
    change_column :options, :result_type, :string, null: true
  end
end
