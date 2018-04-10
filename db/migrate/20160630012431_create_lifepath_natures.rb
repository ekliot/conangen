class CreateLifepathNatures < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_natures do |t|
      # fields
      t.string  :name
      t.string  :attr
      t.text    :description, null: true

      # serialize
      t.text    :skills_mand # as Array [String, String, String]
      t.text    :skills_elec # as Array [String, String, String]

      # references
      t.belongs_to :sourcebook, index: true
      # there is no `belongs_to :talent` here, as that is selected by the user in NatureSelection
    end

    add_index :lifepath_natures, :name
  end
end
