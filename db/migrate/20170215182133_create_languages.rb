class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      # fields
      t.string :name
      t.string :group
    end

    # indices
    add_index :languages, :name
    add_index :languages, :group
  end
end
