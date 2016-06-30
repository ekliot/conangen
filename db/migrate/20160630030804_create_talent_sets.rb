class CreateTalentSets < ActiveRecord::Migration
  def change
    create_table :talent_sets do |t|
      t.references :character

      t.timestamps null: false
    end

    add_index :talent_sets, [:user_id]
  end
end
