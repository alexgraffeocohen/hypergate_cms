class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :failure_text, null: false
      t.text :description, null: false
      t.references :outcome, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
