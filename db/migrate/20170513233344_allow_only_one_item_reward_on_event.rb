class AllowOnlyOneItemRewardOnEvent < ActiveRecord::Migration
  def up
    drop_table :item_rewards
    add_belongs_to :events, :item
  end

  def down
    ActiveRecord::IrreversibleMigration
  end
end
