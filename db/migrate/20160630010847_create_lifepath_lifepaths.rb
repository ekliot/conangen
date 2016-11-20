class CreateLifepathLifepaths < ActiveRecord::Migration[5.0]
  def change
    create_table :lifepath_lifepaths do |t|
      # fields
      t.integer :base_attr, default: 7
      t.integer :max_attr,  default: 14
      t.integer :max_skill, default: 5

      # serialize
      t.text :forbidden # as Hash { lifepath: [ names of forbidden choices ] } i.e. { homeland: ["Khitai"] }

      # references
      t.belongs_to :character,          index: true, unique: true
      # personal
      # sorcery
    end
  end
end
