class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :encounter, null: false
      t.text :text, null: false
      t.integer :order, null: false

      t.timestamps null: false
    end
  end
end
