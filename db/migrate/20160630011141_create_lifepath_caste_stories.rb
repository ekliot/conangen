class CreateLifepathCasteStories < ActiveRecord::Migration
  def change
    create_table :lifepath_caste_stories do |t|
      t.string :name
      t.text :description
      t.string :trait

      t.references :caste
    end

    add_index :lifepath_caste_stories, :name
    add_index :lifepath_caste_stories, :caste_id
  end
end
