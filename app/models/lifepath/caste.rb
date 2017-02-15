class Lifepath::Caste < ApplicationRecord

  has_many    :caste_stories
  belongs_to  :skill
  belongs_to  :sourcebook

  serialize :talents, Array

end
