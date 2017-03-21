class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :role, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
