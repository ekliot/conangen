class CreateLifepathStoryCastes < ActiveRecord::Migration
  def change
    create_table :lifepath_story_castes do |t|
      t.string :name
      t.text :description
      t.string :trait
      t.string :caste

      t.timestamps null: false
    end
  end
end
