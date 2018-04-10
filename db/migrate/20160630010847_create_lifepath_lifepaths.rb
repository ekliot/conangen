class CreateLifepathLifepaths < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_lifepaths do |t|
      # fields
      t.integer :base_attr, default: 7
      t.integer :max_attr,  default: 14
      t.integer :max_skill, default: 5

      t.integer :skilled_thresh, default: 3 # the maximum a skill can be at before it is considered "skilled"
      t.integer :skilled_max,    default: 3 # the maximum number of "skilled" skills

      t.boolean :sorcery_allowed, default: true
      t.boolean :fortune_spends, default: true

      # references
      t.belongs_to :character, index: true, unique: true
      # personal
      # sorcery
    end
  end
end
