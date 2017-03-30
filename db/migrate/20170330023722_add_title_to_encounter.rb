class AddTitleToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :title, :string
  end
end
