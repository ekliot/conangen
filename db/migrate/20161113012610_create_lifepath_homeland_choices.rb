class CreateLifepathHomelandChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_homeland_choices do |t|
      # fields
      # TODO change this to use Languages
      t.string      :language

      # references
      t.belongs_to  :lifepath, index: true, unique: true
      t.belongs_to  :homeland
    end
  end
end
