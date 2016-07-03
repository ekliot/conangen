class Lifepath::Lifepath < ApplicationRecord
  belongs_to :character

  belongs_to :homeland
  belongs_to :caste
  belongs_to :story_caste
  belongs_to :archetype
  belongs_to :nature
  belongs_to :education
  belongs_to :story_war
end
