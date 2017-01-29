class Lifepath::Aspect < ApplicationRecord

  belongs_to :sourcebook

  serialize :attrs, Hash # { mandatory: [1, 2], optional: [1, 2] }

end
