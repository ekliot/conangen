class CreateLifepathCastes < ActiveRecord::Migration
  def change
    create_table :lifepath_castes do |t|
      t.string :name
      t.string :skill
      t.integer :social_standing
      t.text :description

      t.text :talents

      t.timestamps null: false
    end

    add_index :lifepath_castes, :name
  end
end
