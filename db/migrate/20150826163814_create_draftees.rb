class CreateDraftees < ActiveRecord::Migration
  def change
  	create_table :draftees do |t|
  		t.references :team
  		t.references :player
  		t.references :draft
      # t.boolean :picked
  	end
  end
end
