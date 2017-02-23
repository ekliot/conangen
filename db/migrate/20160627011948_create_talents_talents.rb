class CreateTalentsTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents_talents do |t|
      # fields
      t.string  :name
      t.string  :tree
      t.integer :max_ranks,   default: 1
      t.text    :description, null: true

      # serialize
      t.text :variants, null: true  # as Array [ String...String ]

      t.belongs_to :skill, index: true, null: true
      t.belongs_to :sourcebook, index: true
    end

    add_index :talents_talents, :name
    add_index :talents_talents, :tree
  end
end
