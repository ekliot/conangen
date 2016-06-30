class CreateLifepathStoryWars < ActiveRecord::Migration
  def change
    create_table :lifepath_story_wars do |t|
      t.string :name
      t.string :skill1
      t.string :skill2

      t.timestamps null: false
    end
  end
end
