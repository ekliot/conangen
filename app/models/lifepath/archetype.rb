class Lifepath::Archetype < ApplicationRecord

  belongs_to :talent
  belongs_to :sourcebook

  belongs_to :career_skill, source: :skills
  has_many :mandatory_skills, source: :skills
  has_many :elective_skills, source: :skills

  serialize :skills,    Hash  # {  }
  serialize :equipment, Hash  #

end
