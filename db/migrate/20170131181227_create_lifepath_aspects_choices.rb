class CreateLifepathAspectsChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_aspects_choices do |t|
      t.string :best
      t.string :worst
      t.string :opt1
      t.string :opt2
      t.references :aspect1, foreign_key: true
      t.references :aspect2, foreign_key: true

      t.timestamps
    end
  end
end
