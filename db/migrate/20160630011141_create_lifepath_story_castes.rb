class CreateLifepathStoryCastes < ActiveRecord::Migration
  def change
    create_table :lifepath_story_castes do |t|
      t.string :name
      t.text :description
      t.string :trait

      t.references :castes

      t.timestamps null: false
    end

    add_index :lifepath_story_castes, :caste_id
  end
end
