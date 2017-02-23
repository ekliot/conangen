class CreateTalentsPrereqTalents < ActiveRecord::Migration[5.0]
  def change
    create_table :talents_prereq_talents do |t|
      # attributes
      t.boolean :mandatory
      t.integer :min_rank

      # references
      t.belongs_to :required
      t.belongs_to :requirer
    end
  end
end
