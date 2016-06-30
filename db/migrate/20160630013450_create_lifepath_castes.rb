class CreateLifepathCastes < ActiveRecord::Migration
  def change
    create_table :lifepath_castes do |t|
      t.string :name
      t.string :skill
      t.integer :social_standing
      t.text :description

      t.timestamps null: false
    end
  end
end
