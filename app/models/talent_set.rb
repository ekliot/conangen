class TalentSet < ActiveRecord::Base
  belongs_to :character
  has_many: :talents
end
