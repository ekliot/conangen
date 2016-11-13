class CreateSourcebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :sourcebooks do |t|
      t.string :title
    end

    add_index :sourcebooks, :title
  end
end
