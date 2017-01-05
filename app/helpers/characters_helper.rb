module CharactersHelper

  @@skills = [
    :acrobatics,  :alchemy, :animal_handling, :athletics,   :command,
    :counsel,     :craft,   :discipline,      :healing,     :insight,
    :linguistics, :lore,    :melee,           :observation, :parry,
    :persuade,    :ranged,  :resistance,      :sailing,     :society,
    :sorcery,     :stealth, :survival,        :thievery,    :warfare
  ]

  @@career_skills = [
    :acrobatics,  :animal_handling, :athletics, :counsel, :lore,
    :melee,       :observation,     :persuade,  :ranged,  :society
  ]

  # generates a title/intro for a character given their lifepath
  # can be formatted for HTML
  # formatted as:
  #   all three args present:
  #       "Hither came $name, the $archetype, of $homeland..."
  #   name is blank:
  #       "Hither came a wanderer, a(n) $archetype, of $homeland..."
  #   archetype is blank:
  #       "Hither came $name, of $homeland..."
  #   homeland is blank:
  #       "Hither came $name, the $archetype..."
  #   only name:
  #       "Hither came $name..."
  #   only archetype:
  #       "Hither came a wanderer, a(n) $archetype..."
  #   only homeland:
  #       "Hither came a wanderer, of $homeland..."
  #   none:
  #       "Hither came a wanderer..."
  def self.gen_title( name, archetype, homeland, html )
    title =  html ? '<span id="CharTitle">' : ''

    title << html ? '<span id="CharTitleIntro">Hither came</span>' : "Hither came"

    if !name.blank?
      title << html ? '<span id="CharTitleName"> #{name}</span>' : ' #{name}'
    else
      title << html ? '<span id="CharTitleName"> a wanderer</span>' : ' a wanderer'
    end

    if !archetype.blank?
      article = ''

      if name.blank?
        article = %w(a e i o u).include?( archetype[0].downcase ) ? 'an' : 'a'
      else
        article = 'the'
      end

      title << html ? ', <span id="CharTitleArchetype"> #{article} #{archetype}</span>': ', #{article} #{archetype}'
    end

    if !homeland.blank?
      title << html ? ', <span id="CharTitleHomeland"> of #{homeland}</span>' : ', of #{homeland}'
    end

    title << '...'

    title
  end

  def self.skills
    @@skills
  end

  def self.career_skills
    @@career_skills
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
