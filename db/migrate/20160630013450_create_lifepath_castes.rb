class CreateLifepathCastes < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_castes do |t|
      # fields
      t.string  :name
      t.integer :standing
      t.text    :description, null: true

      # serialize
      t.text :talents # as Array of two Talents # TODO convert this to has_many? or two belongs_to?

      # relations
      t.belongs_to :skill
      t.belongs_to :sourcebook, index: true
    end

    # indices
    add_index :lifepath_castes, :name
  end
end
