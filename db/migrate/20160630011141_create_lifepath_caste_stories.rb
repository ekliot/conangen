class CreateLifepathCasteStories < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_caste_stories do |t|
      # fields
      t.string  :name
      t.text    :description, null: true
      t.string  :trait

      # references
      t.belongs_to :caste,      index: true
      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_caste_stories, :name
  end
end
