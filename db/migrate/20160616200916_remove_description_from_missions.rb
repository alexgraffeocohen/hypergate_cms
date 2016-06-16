class RemoveDescriptionFromMissions < ActiveRecord::Migration
  def change
    remove_column :missions, :description, :text
  end
end
