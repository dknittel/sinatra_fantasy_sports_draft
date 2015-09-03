class CreatePlayers < ActiveRecord::Migration
  def change
  	create_table :players do |t|
      t.string :Name, null: false
  		t.string :Team
  		t.integer :Games
  		t.integer :Minutes
  		t.integer :FieldGoalsPercentage
  		t.string :Position
      t.integer :ThreePointersPercentage
      t.integer :FreeThrowsPercentage
      t.integer :Rebounds
      t.integer :Assists
      t.integer :Steals
      t.integer :BlockedShots
      t.integer :Turnovers
      t.integer :Points
  		t.integer :pool_id
  		#include pic of player?

  		t.timestamps
    end
  end
end
