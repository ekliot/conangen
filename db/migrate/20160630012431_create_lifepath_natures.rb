class CreateLifepathNatures < ActiveRecord::Migration
  def change
    create_table :lifepath_natures do |t|
      t.string :name
      t.string :attribute
      t.string :skill_mandatory1
      t.string :skill_mandatory2
      t.string :skill_mandatory3
      t.string :skill_elective1
      t.string :skill_elective2
      t.string :skill_elective3

      t.references :talent

      t.timestamps null: false
    end
  end
end
