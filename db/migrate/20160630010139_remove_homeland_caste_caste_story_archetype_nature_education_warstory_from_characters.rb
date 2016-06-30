class RemoveHomelandCasteCasteStoryArchetypeNatureEducationWarstoryFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :homeland, :string
    remove_column :characters, :caste, :string
    remove_column :characters, :caste_story, :string
    remove_column :characters, :archetype, :string
    remove_column :characters, :nature, :string
    remove_column :characters, :education, :string
    remove_column :characters, :warstory, :string
  end
end
