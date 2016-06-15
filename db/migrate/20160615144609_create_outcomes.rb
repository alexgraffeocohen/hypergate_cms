class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
