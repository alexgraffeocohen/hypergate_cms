class CreateGalacite < ActiveRecord::Migration
  def change
    create_table :galacite do |t|

      t.timestamps null: false
    end
  end
end
