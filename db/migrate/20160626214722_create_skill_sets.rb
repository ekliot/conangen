class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.integer :acrobatics_exp
      t.integer :acrobatics_foc
      t.integer :alchemy_exp
      t.integer :alchemy_foc
      t.integer :animal_handling_exp
      t.integer :animal_handling_foc
      t.integer :athletics_exp
      t.integer :athletics_foc
      t.integer :command_exp
      t.integer :command_foc
      t.integer :counsel_exp
      t.integer :counsel_foc
      t.integer :craft_exp
      t.integer :craft_foc
      t.integer :discipline_exp
      t.integer :discipline_foc
      t.integer :healing_exp
      t.integer :healing_foc
      t.integer :insight_exp
      t.integer :insight_foc
      t.integer :linguistics_exp
      t.integer :linguistics_foc
      t.integer :lore_exp
      t.integer :lore_foc
      t.integer :melee_exp
      t.integer :melee_foc
      t.integer :observation_exp
      t.integer :observation_foc
      t.integer :parry_exp
      t.integer :parry_foc
      t.integer :persuade_exp
      t.integer :persuade_foc
      t.integer :ranged_exp
      t.integer :ranged_foc
      t.integer :resistance_exp
      t.integer :resistance_foc
      t.integer :sailing_exp
      t.integer :sailing_foc
      t.integer :siegecraft_exp
      t.integer :siegecraft_foc
      t.integer :society_exp
      t.integer :society_foc
      t.integer :sorcery_exp
      t.integer :sorcery_exp
      t.integer :stealth_exp
      t.integer :stealth_foc
      t.integer :survival_exp
      t.integer :survival_foc
      t.integer :thievery_exp
      t.integer :thievery_foc

      t.references :character

      t.timestamps null: false
    end

    add_index :skill_sets, :character_id
    add_index :skill_sets, :created_at
    add_index :skill_sets, :updated_at
  end
end
