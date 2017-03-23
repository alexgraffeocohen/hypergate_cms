class CreateItemRewards < ActiveRecord::Migration
  def change
    create_table :item_rewards do |t|
      t.belongs_to :item, index: true, foreign_key: true, null: false
      t.belongs_to :event, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
