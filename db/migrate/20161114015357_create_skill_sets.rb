class CreateSkillSets < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_sets do |t|
      # serialzied
      t.text :skills # as Hash { skill: { exp: A, foc: B }, ... skill: { ... } }

      # relations
      t.belongs_to :character, index: true, unique: true

      t.timestamps
    end
  end
end
