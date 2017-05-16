class AddRequirementsToEventRewards < ActiveRecord::Migration
  def change
    add_column :events, :item_role_requirement_id, :integer
    add_column :events, :ship_module_role_requirement_id, :integer
  end
end
