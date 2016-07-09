class TalentSet < ApplicationRecord
  belongs_to :character
  has_many :talents
end
