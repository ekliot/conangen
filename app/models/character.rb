class Character < ActiveRecord::Base
  belongs_to :user

  has_one :skill_set, dependent: :destroy, validate: true
  has_one :lifepath, dependent: :destroy
  has_one :talent_set, dependent: :destroy
end
