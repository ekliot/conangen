class Lifepath::Homeland < ApplicationRecord

  belongs_to :talent
  belongs_to :sourcebook

  serialize :languages, Array

end
