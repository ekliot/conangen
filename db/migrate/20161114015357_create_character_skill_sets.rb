class CreateCharacterSkillSets < ActiveRecord::Migration[5.0]
  def change
    create_table :character_skill_sets do |t|
      # attributes
      t.integer :acrobatics_exp
      t.integer :acrobatics_foc
      # ... TODO ...
      t.integer :warfare_exp
      t.integer :warfare_foc

      # relations
      t.belongs_to :character, index: true, unique: true

      t.timestamps
    end
  end
end
