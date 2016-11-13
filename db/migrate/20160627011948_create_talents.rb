class CreateTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents do |t|
      # fields
      t.string  :name
      t.string  :skill
      t.integer :max_ranks, default: 1
      t.text    :description, null: true

      # serialize
      t.text :pre_skills
      t.text :pre_talents

      t.references :sourcebook
    end

    add_index :talents, :name
    add_index :talents, :skill
  end
end
