class CreateLifepathArchetypeChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_archetype_choices do |t|
      # fields
      t.string elective1
      t.string elective2

      # has many equipment_weapon
      # has many equipment_armor
      # has many equipment_mount
      # has many equipment_kit
      # has many equipment_other

      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :archetype
    end
  end
end
