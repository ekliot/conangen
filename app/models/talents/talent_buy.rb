class Talents::TalentBuy < ApplicationRecord

  belongs_to :talent_set
  belongs_to :talent

end
