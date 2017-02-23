class Talents::TalentSet < ApplicationRecord

  belongs_to :character

  has_many :talent_buys
  has_many :talents, through: :talent_buys

end
