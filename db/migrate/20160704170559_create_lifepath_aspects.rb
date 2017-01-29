class CreateLifepathAspects < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_aspects do |t|
      # fields
      t.string  :name

      # serialize
      t.text    :attrs # as Hash { mandatory: [1, 2], optional: [1, 2] }

      # references
      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_aspects, :name
  end
end
