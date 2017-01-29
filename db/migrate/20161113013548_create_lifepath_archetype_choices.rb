class CreateLifepathArchetypeChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_archetype_choices do |t|
      # fields
      #   electives
      #   equipment

      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :archetype
    end
  end
end
