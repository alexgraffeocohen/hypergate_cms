class AddPublishedToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :published, :boolean, null: false, default: false
  end
end
