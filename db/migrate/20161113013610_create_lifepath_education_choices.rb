class CreateLifepathEducationChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_education_choices do |t|
      # fields
      #   electives
      #   equipment

      # references
      t.belongs_to :lifepath, index: true, unique: true
      t.belongs_to :education
      # t.belongs_to :talent_buy
    end
  end
end
