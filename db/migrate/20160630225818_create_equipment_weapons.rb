class CreateEquipmentWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_weapons do |t|
      t.string :name
      t.integer :cost
      t.string :reach
      t.string :size
      t.string :qualities
      t.string :category # i.e. Ranged vs Melee
      t.integer :damage
      t.integer :availability
      t.integer :encumbrance
      t.string :type # i.e. Axe vs Sword, Bow vs Crossbow
    end

    add_index :equipment_weapons, :name
    add_index :equipment_weapons, :type
    add_index :equipment_weapons, :cost
    add_index :equipment_weapons, :category
    add_index :equipment_weapons, :availability
  end
end
