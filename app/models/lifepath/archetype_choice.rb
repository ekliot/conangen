class Lifepath::ArchetypeChoice < ApplicationRecord

  belongs_to :archetype
  has_one :talent, through: :archetype

end
