class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :option, null: false, foreign_key: true
      t.text :introduction, null: false
      t.text :success_text, null: false
      t.text :failure_text, null: false

      t.timestamps null: false
    end
  end
end
