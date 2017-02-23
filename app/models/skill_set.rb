class SkillSet < ApplicationRecord

  serialize :skills, Hash # { skill: { exp: E, foc: F } }

end
