class CreateLifepathHomelands < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_homelands do |t|
      # fields
      t.string  :name

      # references
      t.belongs_to :talent
      t.belongs_to :sourcebook, index: true
    end

    add_index :lifepath_homelands, :name
  end
end
