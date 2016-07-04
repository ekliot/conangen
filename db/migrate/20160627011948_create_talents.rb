class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
      t.string :skill
      t.integer :max_ranks, default: 1
      t.text :description

      t.text :pre_skills
      t.text :pre_talents
    end

    add_index :talents, :name
    add_index :talents, :skill
  end
end
