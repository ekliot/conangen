class CreateLifepathWarStoryChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_war_story_choices do |t|
      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :war_story
    end
  end
end
