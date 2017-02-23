class CreateTalentsTalentBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :talents_talent_buys do |t|
      # attributes
      t.integer :xp_spent
      t.string :source
      t.integer :rank
      t.string :variant

      # relations
      t.belongs_to :talent,     index: true
      t.belongs_to :talent_set, index: true

      t.timestamps
    end
  end
end
