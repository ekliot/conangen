class CreateLifepathNatures < ActiveRecord::Migration
  def change
    create_table :lifepath_natures do |t|
      t.string :name
      t.string :attr
      t.string :skill_mandatory1
      t.string :skill_mandatory2
      t.string :skill_mandatory3
      t.string :skill_elective1
      t.string :skill_elective2
      t.string :skill_elective3

      t.text :description
    end

    add_index :lifepath_natures, :name
  end
end
