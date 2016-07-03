# PREREQ FORMATS:
#   skills  :: "skill exp foc;...;ski­ll exp foc"  << AND >>
#   talents :: "talen­t rank;...;tal­ent rank"      << OR  >> (except 'Smell Out Sorcery', 'Ear of the King')

class Talent < ActiveRecord::Base

  def skill_prereq
    skill_hash = {}

    if !self.pre_skills.empty?

      skills = self.pre_skills.split(';')

      skills.each do |skill|
        prereq = skill.split(' ')

        skill_hash[ prereq[0] ] = { exp: prereq[1].to_i, foc: prereq[2].to_i }
      end

    end

    skill_hash
  end

  def talent_prereq
    talent_hash = {}

    if !self.pre_talents.empty?

      talent = self.pre_talent.split(';')

      talent.each do |talent|
        prereq = talent.split(' ')

        talent_hash[ prereq[0].gsub( /_/, ' ' ) ] = { rank: prereq[1].to_i }
      end

    end

    talent_hash
  end

end
