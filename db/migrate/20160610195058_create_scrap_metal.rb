class CreateScrapMetal < ActiveRecord::Migration
  def change
    create_table :scrap_metal do |t|

      t.timestamps null: false
    end
  end
end
