class Talents::Talent < ApplicationRecord

  belongs_to :skill

  has_many :pre_talents
  has_many :pre_skills

  serialize :variants,    Array # [ String...String ]

  def required_by()
    # get each Talents:PrereqTalent with this as its "required"
    # return a Hash of those Prereqs' 'requirer's => { talent: [ Talent, min_rank ], .. , talent: [ .. ] }
  end

  def required_talents()
    # get each Talents:PrereqTalent with this as its "requirer"
    # return a List of Hashes of those Prereqs' 'required's => [ { talent: Talent, min_rank: M }, .. , { .. } ]
  end

  def required_skills()
    # get each Talents:PrereqSkill with this as its "requirer"
    # return a List a Hash of those Prereqs' 'required's => [ { skill: Skill, mins: { exp: E, foc: F } }, .. , { .. } ]
  end

end
