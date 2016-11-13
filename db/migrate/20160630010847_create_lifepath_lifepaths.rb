class CreateLifepathLifepaths < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_lifepaths do |t|
      t.belongs_to :character,          index: true, unique: true
      # personal
      # sorcery
    end
  end
end
