class CreateTalentsTalentSets < ActiveRecord::Migration[5.0]
  def change
    create_table :talents_talent_sets do |t|
      t.belongs_to :character, index: true

      t.timestamps null: false
    end
  end
end
