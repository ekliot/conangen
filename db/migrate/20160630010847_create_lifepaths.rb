class CreateLifepaths < ActiveRecord::Migration
  def change
    create_table :lifepaths do |t|

      t.timestamps null: false
    end
  end
end
