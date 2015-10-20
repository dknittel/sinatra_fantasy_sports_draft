class AddPointsRankColumnToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :points_rank, :integer
  end
end
