class Team < ActiveRecord::Base
  has_many :draftees
  belongs_to :draft

  # validates :name, uniqueness: true
end
