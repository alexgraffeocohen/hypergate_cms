class DropItemAndModuleEventRequirements < ActiveRecord::Migration
  def change
    remove_column :options, :required_module_id, :integer, index: true
    remove_column :options, :required_item_id, :integer, index: true
  end
end
