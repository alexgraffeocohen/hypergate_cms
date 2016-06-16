class CreateAwayMissionResponses < ActiveRecord::Migration
  def change
    create_table :away_mission_responses do |t|
      t.references :mission, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true, null: false
      t.references :away_team_mission, index: true, foreign_key: true, null: false
      t.text :response, null: false

      t.timestamps null: false
    end
  end
end
