class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.text :appearance
      t.text :personality
      t.string :homeland
      t.string :caste
      t.string :caste_story
      t.string :trait
      t.string :archetype
      t.string :nature
      t.string :education
      t.string :warstory
      t.integer :exp_total
      t.integer :exp_spent
      t.integer :fortune_max
      t.integer :fortune_current
      t.integer :gold
      t.integer :renown
      t.integer :standing
      t.integer :attr_agility
      t.integer :attr_awareness
      t.integer :attr_brawn
      t.integer :attr_coordination
      t.integer :attr_intelligence
      t.integer :attr_personality
      t.integer :attr_willpower
      t.integer :dmg_ranged
      t.integer :dmg_melee
      t.integer :dmg_presence
      t.integer :courage
      t.integer :armour_head
      t.integer :armour_rarm
      t.integer :armour_larm
      t.integer :armour_rleg
      t.integer :armour_lleg
      t.integer :armour_torso
      t.string :armour_qualities
      t.integer :vigor_max
      t.integer :vigor_current
      t.integer :resolve_max
      t.integer :resolve_current
      t.integer :wounds_current
      t.integer :trauma_current
      t.string :talent_homeland
      t.string :talent_caste1
      t.string :talent_caste2
      t.text :contacts
      t.text :background
      t.string :languages

      t.timestamps null: false
    end
  end
end
