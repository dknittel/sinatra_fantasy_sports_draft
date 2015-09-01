class CreatePools < ActiveRecord::Migration
  def change
  	create_table :pools do |t|
  		t.string :name
  	end
  end
end
