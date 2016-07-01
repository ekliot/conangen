class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
      t.string :skill
      t.integer :max_ranks, default: 1
      t.text :description

      t.string :pre_skills
      t.string :pre_talents
      
      t.boolean :pre_talent_opt, default: true

      t.timestamps null: false
    end

    add_index :talents, :name
    add_index :talents, :skill
  end
end
