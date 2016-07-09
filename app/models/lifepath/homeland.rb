class Lifepath::Homeland < ApplicationRecord
  belongs_to :talent

  def parse_languages
    self.language.split( ";" )
  end

end

# PARSE LANGUAGE OPTION (Border Kingdoms, Black Kingdoms, etc.)
