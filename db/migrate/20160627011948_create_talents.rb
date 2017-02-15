class CreateTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents do |t|
      # fields
      t.string  :name
      t.string  :tree
      t.integer :max_ranks,   default: 1
      t.text    :description, null: true

      # serialize
      t.text :pre_skills            # as Hash { skill: { exp: min, foc: min } }
      t.text :pre_talents           # as Hash { mandatory: { talent: rank }, optional: { talent: rank } }
      t.text :variants, null: true  # as Array [ String...String ]

      t.belongs_to :skill, index: true, null: true
      t.belongs_to :sourcebook, index: true
    end

    add_index :talents, :name
    add_index :talents, :tree
  end
end
