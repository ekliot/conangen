class CreateLifepathCasteStoryChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_caste_story_choices do |t|
      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :caste_story
    end
  end
end
