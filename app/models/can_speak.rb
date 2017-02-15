class CanSpeak < ApplicationRecord

  # ============
  # ASSOCIATIONS

  belongs_to :speaker, polymorphic: true
  belongs_to :language

end
