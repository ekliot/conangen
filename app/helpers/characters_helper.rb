module CharactersHelper

  @@skills = [
    :acrobatics,  :alchemy, :animal_handling, :athletics,   :command,
    :counsel,     :craft,   :discipline,      :healing,     :insight,
    :linguistics, :lore,    :melee,           :observation, :parry,
    :persuade,    :ranged,  :resistance,      :sailing,     :siegecraft,
    :society,     :sorcery, :stealth,         :survival,    :thievery
  ]

  @@career_skills = [
    :acrobatics,  :animal_handling, :athletics, :counsel, :lore,
    :melee,       :observation,     :persuade,  :ranged,  :society
  ]

  def self.skills
    @@skills
  end

  def career_skills
    @@skills
  end

  def self.random_career_skill
    @career_skills.sample
  end

  def self.random_skill
    @skills.sample
  end

  def self.format_skill( skill_name )
    if skill_name == 'ranged'
      'Ranged Weapons'
    else
      skill_name.gsub( '_', ' ' ).capitalize!
    end
  end
end
