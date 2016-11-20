class Lifepath::Aspect < ApplicationRecord

  belongs_to :sourcebook

  serialize :attrs, Hash

end
