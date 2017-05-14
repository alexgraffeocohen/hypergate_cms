class SeedShipModules < ActiveRecord::Migration
  def up
    ShipModule.create([
      { name: "Engineering", role: Role.find_by(name: "Engineer") },
      { name: "Science", role: Role.find_by(name: "Science Officer") },
      { name: "Diplomat", role: Role.find_by(name: "Communications Officer") },
      { name: "Pilot", role: Role.find_by(name: "Pilot") },
      { name: "Combat", role: Role.find_by(name: "Weapons Officer") },
      { name: "Medical", role: Role.find_by(name: "Medical Officer") },
    ])
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
