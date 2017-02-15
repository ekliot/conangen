class Lifepath::Homeland < ApplicationRecord

  # ============
  # ASSOCIATIONS

  belongs_to :talent
  belongs_to :sourcebook

  has_many :can_speaks, as: :speaker
  has_many :languages, :through => :can_speaks

end
