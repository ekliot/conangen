class Lifepath::Archetype < ApplicationRecord

  belongs_to :talent
  belongs_to :sourcebook

  # TODO change skills hash to this, reorganize seeds and update migration to account for this
  # belongs_to :career_skill, source: :skills
  # serialize :mandatory_skills, Array
  # serialize :elective_skills, Array

  serialize :skills,    Hash  # {  }
  serialize :equipment, Hash  #

end
