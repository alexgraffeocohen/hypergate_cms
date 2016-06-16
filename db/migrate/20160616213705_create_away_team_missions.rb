class CreateAwayTeamMissions < ActiveRecord::Migration
  def change
    create_table :away_team_missions do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
