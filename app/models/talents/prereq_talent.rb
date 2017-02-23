class Talents::PrereqTalent < ApplicationRecord

  belongs_to :requirer, class_name: "Talent"
  belongs_to :required, class_name: "Talent"

end
