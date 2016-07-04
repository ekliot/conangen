class CreateLifepathWarStories < ActiveRecord::Migration
  def change
    create_table :lifepath_war_stories do |t|
      t.string :name
      t.string :skill1
      t.string :skill2
    end

    add_index :lifepath_war_stories, :name
  end
end
