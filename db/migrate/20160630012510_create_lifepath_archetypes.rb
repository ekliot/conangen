class CreateLifepathArchetypes < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_archetypes do |t|
      # fields
      t.string  :name
      t.text    :description, null: true

      # serialize
      t.text    :skills    # as Hash { career: String, mandatory: [String, String, String, String], elective: [String, String, String] }
      t.text    :equipment # as Hash { TODO }

      # references
      t.belongs_to :talent
      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_archetypes, :name
  end
end
