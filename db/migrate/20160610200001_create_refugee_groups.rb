class CreateRefugeeGroups < ActiveRecord::Migration
  def change
    create_table :refugee_groups do |t|

      t.timestamps null: false
    end
  end
end
