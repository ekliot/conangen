class Lifepath::Education < ApplicationRecord

  belongs_to :sourcebook

  serialize :skills, Hash
  serialize :equipment, Hash

  # gets a map of skill->[talents] for a given education
  def get_talents

    skills =  [ self.skill_mandatory1,  self.skill_mandatory2, self.skill_mandatory3,
                self.skill_elective1,   self.skill_elective2,  self.skill_elective3 ]

    talents = {}

    skills.each do |skill|
      # TODO CHECK FOR RANDOM/CAREER SKILL
      talents[skill] = Talent.where( skill: skill ).find_each
    end

    talents

  end

end
