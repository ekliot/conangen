class CreateLifepathCastes < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_castes do |t|
      # fields
      t.string  :name
      t.string  :skill
      t.integer :standing
      t.text    :description, null: true

      # serialize
      t.text :talents # as Array of Talents

      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_castes, :name
  end
end
