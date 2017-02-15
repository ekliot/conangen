class Talent < ApplicationRecord

  belongs_to :skill

  serialize :pre_talents # as Hash { mandatory: { talent: rank }, optional: { talent: rank, talent: rank } }
  serialize :pre_skills  # as Hash { skill: { exp: min, foc: min } }
  serialize :variants    # as Array [ String...String ]

end
