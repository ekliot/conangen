class CreateEquipmentArmours < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_armours do |t|
      t.string :name
      t.boolean :head
      t.boolean :torso
      t.boolean :arm_left
      t.boolean :arm_right
      t.boolean :leg_left
      t.boolean :leg_right
      t.string :qualities
      t.integer :soak
      t.string :type
      t.integer :availability
      t.integer :cost
      t.integer :encumbrance

      t.timestamps
    end
  end
end
