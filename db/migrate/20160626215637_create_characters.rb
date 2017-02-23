class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      # attributes
      t.string  :name, default: ""
      t.integer :age
      t.string  :gender, default: ""
      t.text    :appearance, default: ""
      t.string  :trait, default: ""
      t.integer :standing

      t.integer :exp_total, default: 0
      t.integer :exp_spent, default: 0

      t.integer :attr_agi, default: 7
      t.integer :attr_awa, default: 7
      t.integer :attr_bra, default: 7
      t.integer :attr_coo, default: 7
      t.integer :attr_int, default: 7
      t.integer :attr_per, default: 7
      t.integer :attr_wil, default: 7

      t.integer :fortune_max, default: 3
      t.integer :renown, default: 0
      t.integer :gold

      t.text    :contacts, default: ""
      t.text    :background, default: ""
      t.text    :personality, default: ""

      # serialize
      # this need not be stored, as it is a derived attr
      # t.text :soak, default: ""         # { courage: Int, armor: { head: Int, arm_left: Int, arm_right: Int, torso: Int, leg_left: Int, leg_right: Int, qualities: String } }
      # this need not be stored, as it is a derived attr
      # t.text :health, default: ""       # { stress: { max: { vigor: Int, resolve: Int }, current: { vigor: Int, resolve: Int } }, harm: { wounds: Int, trauma: Int } }
      # this need not be stored, as it is a derived attr
      # t.text :damage, default: ""       # { melee: Int, ranged: Int, presence: Int }

      # relations
      t.belongs_to :user, index: true
      
      t.timestamps

    end

    add_index :characters, :created_at
    add_index :characters, :updated_at
    add_index :characters, :name
  end
end
