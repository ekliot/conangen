class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      # attributes
      t.string  :name, default: ""
      t.integer :age
      t.string  :gender, default: ""
      t.text    :appearance, default: ""
      t.string  :trait, default: ""
      t.integer :exp_total, default: 0
      t.integer :exp_spent, default: 0
      t.integer :fortune_max, default: 3
      t.integer :gold
      t.integer :renown, default: 0
      t.integer :standing
      t.text    :contacts, default: ""
      t.text    :background, default: ""
      t.text    :personality, default: ""

      # serialize
      t.text :soak, default: ""         # { courage: Int, armor: { head: Int, arm_left: Int, arm_right: Int, torso: Int, leg_left: Int, leg_right: Int, qualities: String } }
      t.text :health, default: ""       # { stress: { max: { vigor: Int, resolve: Int }, current: { vigor: Int, resolve: Int } }, harm: { wounds: Int, trauma: Int } }
      t.text :damage, default: ""       # { melee: Int, ranged: Int, presence: Int }
      t.text :skills, default: ""       # { acrobatics: { exp: Int, foc: Int }, ... , warfare: { exp: Int, foc: Int } }
      t.text :attr_stats, default: ""   # { agility: Int, awareness: Int, brawn: Int, coordination: Int, intelligence: Int, personality: Int, willpower: Int }

      # relations
      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    add_index :characters, :created_at
    add_index :characters, :updated_at
    add_index :characters, :name
  end
end
