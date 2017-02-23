class Talents::PrereqSkill < ApplicationRecord

  belongs_to :requirer, class_name: "Talent"
  belongs_to :required, class_name: "Skill"

end
