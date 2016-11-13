class CreateLifepathNatureChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_nature_choices do |t|
      # fields
      #   electives

      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :nature
      # t.belongs_to :talent_buy
    end
  end
end
