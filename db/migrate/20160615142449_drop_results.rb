class DropResults < ActiveRecord::Migration
  def up
    drop_table :results
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
