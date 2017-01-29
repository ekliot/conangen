class Lifepath::Caste < ApplicationRecord

  has_many    :caste_stories
  belongs_to  :sourcebook

  serialize :talents, Array

end
