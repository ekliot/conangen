class Lifepath::Archetype < ApplicationRecord

  belongs_to :talent
  belongs_to :sourcebook

  serialize :skills,    Hash
  serialize :equipment, Hash

end
