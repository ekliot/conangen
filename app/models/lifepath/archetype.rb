class Lifepath::Archetype < ApplicationRecord
  belongs_to :talent
end

# HOW TO PARSE EQUIPMENT?
# separate individual items in the string by [*]
