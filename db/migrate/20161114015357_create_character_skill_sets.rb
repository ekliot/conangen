class CreateCharacterSkillSets < ActiveRecord::Migration[5.0]
  def change
    create_table :character_skill_sets do |t|

      t.timestamps
    end
  end
end
