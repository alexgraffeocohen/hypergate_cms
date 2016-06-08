class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :category_id
      t.integer :sector
      t.string :grid_position
      t.string :description

      t.timestamps null: false
    end
  end
end
