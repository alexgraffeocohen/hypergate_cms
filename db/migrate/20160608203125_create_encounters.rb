class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :category_id, null: false
      t.integer :sector, null: false
      t.string :grid_position, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
