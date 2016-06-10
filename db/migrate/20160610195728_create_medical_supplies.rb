class CreateMedicalSupplies < ActiveRecord::Migration
  def change
    create_table :medical_supplies do |t|

      t.timestamps null: false
    end
  end
end
