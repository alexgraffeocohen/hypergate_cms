class RemoveNullConstraintsFromOptions < ActiveRecord::Migration
  def up
    change_column :options, :text, :text, null: true
    change_column :options, :order, :integer, null: true
    change_column :options, :encounter_id, :integer, null: true
  end

  def down
    change_column :options, :text, :text, null: false
    change_column :options, :order, :integer, null: false
    change_column :options, :encounter_id, :integer, null: false
  end
end
