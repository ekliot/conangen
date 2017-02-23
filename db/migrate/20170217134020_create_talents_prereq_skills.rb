class CreateTalentsPrereqSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :talents_prereq_skills do |t|
      # attributes
      t.integer :min_exp
      t.integer :min_foc

      # references
      t.belongs_to :requirer, class_name: "Talent"
      t.belongs_to :required, class_name: "Skill"
    end
  end
end
