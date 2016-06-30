class RemoveTalentHomelandTalentCaste1TalentCaste2FromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :talent_homeland, :string
    remove_column :characters, :talent_caste1, :string
    remove_column :characters, :talent_caste2, :string
  end
end
