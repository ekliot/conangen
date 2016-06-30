class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
      t.integer :max_ranks
      t.text :description

      t.timestamps null: false
    end
  end
end
