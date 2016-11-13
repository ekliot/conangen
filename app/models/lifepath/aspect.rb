class Lifepath::Aspect < ApplicationRecord

  belongs_to :sourcebook

  serialize :attributes, Hash

end
