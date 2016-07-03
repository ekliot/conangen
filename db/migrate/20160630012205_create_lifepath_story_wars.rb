class CreateLifepathStoryWars < ActiveRecord::Migration
  def change
    create_table :lifepath_story_wars do |t|
      t.string :name
      t.string :skill1
      t.string :skill2
    end

    add_index :lifepath_story_wars, :name
  end
end
