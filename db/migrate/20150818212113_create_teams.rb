class CreateTeams < ActiveRecord::Migration
  def change
  	create_table :teams do |t|
  		t.string :name
  		t.references :draft
  		t.integer :draft_position
  	end
  end
end