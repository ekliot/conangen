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
      t.text :contacts, default: ""
      t.text :background, default: ""
      t.text :personality, default: ""

      t.text :soak, default: ""
      t.text :health, default: ""
      t.text :damage, default: ""
      t.text :skills, default: ""
      t.text :languages, default: ""
      t.text :attr_stats, default: ""

      t.references :user

      t.timestamps null: false
    end

    add_index :characters, :user_id
    add_index :characters, :created_at
    add_index :characters, :updated_at
    add_index :characters, :name
  end
end
