class CreateLifepathHomelands < ActiveRecord::Migration
  def change
    create_table :lifepath_homelands do |t|
      t.string :name
      t.string :language

      t.references :talent
    end

    add_index :lifepath_homelands, :name
  end
end
