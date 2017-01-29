class CreateLifepathWarStories < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_war_stories do |t|
      # fields
      t.string  :name

      # serialize
      t.text    :skills # as Array of Strings

      # references
      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_war_stories, :name
  end
end
