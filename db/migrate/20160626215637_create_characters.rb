class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, default: ""
      t.integer :age
      t.string :gender, default: ""
      t.text :appearance, default: ""
      t.string :trait, default: ""
      t.integer :exp_total, default: 0
      t.integer :exp_spent, default: 0
      t.integer :fortune_max, default: 3
      t.integer :gold
      t.integer :renown, default: 0
      t.integer :standing
      t.integer :attr_agility, default: 7
      t.integer :attr_awareness, default: 7
      t.integer :attr_brawn, default: 7
      t.integer :attr_coordination, default: 7
      t.integer :attr_intelligence, default: 7
      t.integer :attr_personality, default: 7
      t.integer :attr_willpower, default: 7
      t.integer :dmg_ranged, default: 0
      t.integer :dmg_melee, default: 0
      t.integer :dmg_presence, default: 0
      t.integer :courage, default: 0
      t.integer :armour_head, default: 0
      t.integer :armour_rarm, default: 0
      t.integer :armour_larm, default: 0
      t.integer :armour_rleg, default: 0
      t.integer :armour_lleg, default: 0
      t.integer :armour_torso, default: 0
      t.integer :vigor_max
      t.integer :vigor_current
      t.integer :resolve_max
      t.integer :resolve_current
      t.integer :wounds_current, default: 5
      t.integer :trauma_current, default: 5
      t.text :contacts, default: ""
      t.text :background, default: ""
      t.text :personality, default: ""
      t.text :languages, default: ""

      t.references :user

      t.timestamps null: false
    end

    add_index :characters, :user_id
    add_index :characters, :created_at
    add_index :characters, :updated_at
    add_index :characters, :name
  end
end
