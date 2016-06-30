class CreateLifepaths < ActiveRecord::Migration
  def change
    create_table :lifepaths do |t|
      t.timestamps null: false
      t.integer :mod_agility
      t.integer :mod_awareness
      t.integer :mod_brawn
      t.integer :mod_coordination
      t.integer :mod_intelligence
      t.integer :mod_personality
      t.integer :mod_willpower

      t.references :character

      t.references :homeland
      t.references :caste
      t.references :story_caste
      t.references :archetype
      t.references :nature
      t.references :education
      t.references :story_war
    end

    add_index :lifepaths, [:user_id]
  end
end
