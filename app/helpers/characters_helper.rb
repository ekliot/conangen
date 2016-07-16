module CharactersHelper
  def self.format_skill( skill_name )
    if skill_name == 'ranged'
      'Ranged Weapons'
    else
      skill_name.gsub( '_', ' ' ).capitalize!
    end
  end
end
