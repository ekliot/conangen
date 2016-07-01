class CreateEquipmentWeapons < ActiveRecord::Migration
  def change
    create_table :equipment_weapons do |t|
      t.string :name
      t.integer :cost
      t.string :reach
      t.string :size
      t.string :qualities
      t.string :category
      t.integer :damage
      t.integer :availability
      t.integer :encumbrance
      t.string :type

      t.timestamps null: false
    end
  end
end
