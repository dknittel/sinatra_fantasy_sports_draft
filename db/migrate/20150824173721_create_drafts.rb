class CreateDrafts < ActiveRecord::Migration
  def change
  	create_table :drafts do |t|
  		t.integer :current_team
  		t.integer :num_teams
  		t.references :user
  		t.references :pool
  	end
  end
end
