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
  #
  # args:
  #   char => Hash => containing :name, :archetype, :homeland
  #   html => Bool => whether the title should be formatted for HTML
  #
  # formatted as:
  #   all three args present:
  #       "$name, the $archetype of $homeland"
  #   name is blank:
  #       "a(n) $archetype of $homeland"
  #   archetype is blank:
  #       "$name, of $homeland"
  #   homeland is blank:
  #       "$name the $archetype"
  #   only name:
  #       "$name"
  #   only archetype:
  #       "a(n) $archetype"
  #   only homeland:
  #       "a wanderer, of $homeland"
  #   none:
  #       "a wanderer"
  def self.gen_title( char, html )
    title = ( html ? '<span id="CharTitle">' : '' )

    # insert the name chunk
    if !char[:name].blank?

      title << ( html ? '<span id="CharTitleName">' : '' )
      title << " #{char[:name]}"
      title << ( html ? '</span>' : '' )

    elsif char[:archetype].blank?

      title << ( html ? '<span id="CharTitleName">' : '' )
      title << ' a wanderer'
      title << ( html ? '</span>' : '' )

    end

    # insert the archetype chunk
    if !char[:archetype].blank?

      article = ''
      comma = ''

      if char[:name].blank?
        article = ( %w(a e i o u).include?( char[:archetype][0].downcase ) ? 'an' : 'a' )
      else
        article = 'the'
        if !char[:homeland].blank?
          comma = ','
        end
      end

      title << ( html ? '<span id="CharTitleArchetype">' : '' )
      title << "#{comma} #{article} #{char[:archetype]}"
      title << ( html ? '</span>' : '' )

    end

    # insert the homeland chunk
    if !char[:homeland].blank?

      # the exact name of these homelands in the book doesn't read well for the title
      if char[:homeland].downcase == 'bossonian marches' ||
         char[:homeland].downcase == 'border kingdom'
        char[:homeland] = 'the ' + char[:homeland]
      end

      comma = ''

      if char[:archetype].blank?
        comma = ','
      end

      title << ( html ? '<span id="CharTitleHomeland">' : '' )
      title << ", of #{char[:homeland]}"
      title << ( html ? '</span>' : '' )

    end

    title << ( html ? '</span>' : '' )

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
