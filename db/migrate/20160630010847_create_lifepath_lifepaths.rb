class CreateLifepathLifepaths < ActiveRecord::Migration
  def change
    create_table :lifepath_lifepaths do |t|
      t.references :character

      t.references :homeland
      t.references :caste
      t.references :story_caste
      t.references :archetype
      t.references :nature
      t.references :education
      t.references :story_war
    end

    add_index :lifepath_lifepaths, [:character_id]
  end
end
