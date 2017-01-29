# PREREQ FORMATS:
#   skills  :: "skill exp foc;...;ski­ll exp foc"  << AND >>
#   talents :: "talen­t rank;...;tal­ent rank"      << OR  >> (except 'Smell Out Sorcery', 'Ear of the King')

class Talent < ApplicationRecord

  serialize :pre_talents
  serialize :pre_skills
  serialize :variants

end
