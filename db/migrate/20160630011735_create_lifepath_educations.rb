class CreateLifepathEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_educations do |t|
      # fields
      t.string  :name
      t.text    :description, null: true

      # serialize
      t.text    :skills # as Hash { mandatory: [String, String, String], elective: [String, String, String] }
      t.text    :equipment # as Hash { TODO }

      # references
      t.belongs_to :sourcebook, index: true
      # there is no `belongs_to :talent` here, as that is selected by the user in EducationSelection
    end

    add_index :lifepath_educations, :name
  end
end
