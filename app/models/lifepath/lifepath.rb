class Lifepath::Lifepath < ApplicationRecord

  belongs_to :character

  has_one :homeland_choice
  has_one :homeland,    through: :homeland_choice

  # TODO aspects?
  # has_one  :aspects_choice
  # has_many :aspects,    through: :aspects_choice

  has_one :caste_choice
  has_one :caste,       through: :caste_choice

  has_one :caste_story_choice
  has_one :caste_story, through: :caste_story_choice

  has_one :archetype_choice
  has_one :archetype,   through: :archetype_choice

  has_one :nature_choice
  has_one :nature,      through: :nature_choice

  has_one :education_choice
  has_one :education,   through: :education_choice

  has_one :war_story_choice
  has_one :war_story,   through: :war_story_choice

end
