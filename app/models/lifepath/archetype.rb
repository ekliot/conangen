class Lifepath::Archetype < ApplicationRecord

  belongs_to :talent
  belongs_to :sourcebook

  serialize :skills_mand, Array
  serialize :skills_elec, Array
  serialize :equipment, Hash  #

  # TODO change skills hash to this, reorganize seeds and update migration to account for this
  # belongs_to :career_skill, source: :skills

end
