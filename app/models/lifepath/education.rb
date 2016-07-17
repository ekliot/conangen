class Lifepath::Education < ApplicationRecord
  def get_talents
    skills =  [ self.skill_mandatory1,  self.skill_mandatory2, self.skill_mandatory3,
                self.skill_elective1,   self.skill_elective2,  self.skill_elective3 ]

    talents = {}

    skills.each do |skill|
      talents[skill] = Talent.where( skill: skill ).find_each
    end

    talents
  end
end
