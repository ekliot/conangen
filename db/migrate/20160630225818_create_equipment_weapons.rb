class CreateEquipmentWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_weapons do |t|
      t.string  :name
      t.string  :size
      t.string  :reach
      t.integer :damage
      t.string  :qualities    # semi-colon separated
      t.integer :cost
      t.integer :availability
      t.integer :encumbrance
      t.string  :category     # i.e. Ranged vs Melee
      t.string  :subcategory  # i.e. Axe vs Sword, Bow vs Crossbow
    end

    add_index :equipment_weapons, :name
    add_index :equipment_weapons, :cost
    add_index :equipment_weapons, :category
    add_index :equipment_weapons, :type
    add_index :equipment_weapons, :availability
  end
end
