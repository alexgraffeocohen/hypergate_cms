class AddRequiredModuleAndItemToOptions < ActiveRecord::Migration
  def change
    add_column :options, :required_module_id, :integer, index: true
    add_column :options, :required_item_id, :integer, index: true

    add_foreign_key :options, :ship_modules, column: :required_module_id
    add_foreign_key :options, :items, column: :required_item_id
  end
end
