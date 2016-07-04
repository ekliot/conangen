class CreateLifepathAspects < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_aspects do |t|
      t.string :name
      t.string :mandatory_attribute1
      t.string :mandatory_attribute2
      t.string :optional_attribute1
      t.string :optional_attribute2
    end
    add_index :lifepath_aspects, :name
  end
end
