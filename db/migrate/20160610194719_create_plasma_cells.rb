class CreatePlasmaCells < ActiveRecord::Migration
  def change
    create_table :plasma_cells do |t|

      t.timestamps null: false
    end
  end
end
