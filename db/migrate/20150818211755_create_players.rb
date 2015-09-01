class CreatePlayers < ActiveRecord::Migration
  def change
  	create_table :players do |t|
      t.string :name, null: false
  		t.integer :ppg
  		t.integer :apg
  		t.integer :rpg
  		t.integer :spg
  		t.string :position
  		t.string :nba_team
  		t.integer :pool_id
  		#include pic of player?

  		t.timestamps
    end
  end
end
