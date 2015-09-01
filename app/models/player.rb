class Player < ActiveRecord::Base
  has_many :draftees
  belongs_to :pool
  validates :name, presence: true, uniqueness: true
  validates :ppg, presence: true
  validates :apg, presence: true
  validates :rpg, presence: true
  validates :spg, presence: true
  validates :position, presence: true
  validates :nba_team, presence: true
  # validates :team, absence: true
end
