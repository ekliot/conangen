class Sourcebook < ApplicationRecord

  has_many :talents

  has_many :homelands
  has_many :aspects
  has_many :castes
  has_many :caste_stories
  has_many :archetypes
  has_many :natures
  has_many :educations
  has_many :war_stories

end
