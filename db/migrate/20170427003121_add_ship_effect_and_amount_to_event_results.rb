class AddShipEffectAndAmountToEventResults < ActiveRecord::Migration
  def change
    add_column :event_results, :amount, :integer, null: false, default: 0
    add_belongs_to :event_results, :ship_effect, null: false
  end
end
