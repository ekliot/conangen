class CreateLifepathHomelandChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_homeland_choices do |t|
      # fields
      t.string      :language

      # references
      t.belongs_to  :lifepath, index: true, unique: true
      t.belongs_to  :homeland
    end
  end
end
