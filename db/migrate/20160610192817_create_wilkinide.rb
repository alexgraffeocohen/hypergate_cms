class CreateWilkinide < ActiveRecord::Migration
  def change
    create_table :wilkinide do |t|

      t.timestamps null: false
    end
  end
end
