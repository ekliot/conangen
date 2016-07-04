class Character < ApplicationRecord

  # =============
  # ASSOCIATIONS

  belongs_to :user

  has_one :skill_set, dependent: :destroy, validate: true
  has_one :lifepath, dependent: :destroy
  has_one :talent_set, dependent: :destroy

  # =============
  # SERIALIZATION

  serialize :languages, Array

  # =============
  # VALIDATION

  validate on: :create do |character|
    NewCharValidator.new( character ).validate
  end

  validates :age, numericality: { greater_than_or_equal_to: 0 }

  # validates :exp_total, minimum: 0
  # validates :exp_spent, maximum: :exp_total

  validates :name, presence: true
  validates :trait, presence: true
  validates :age, presence: true
  validates :standing, presence: true
  validates :gold, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

class NewCharValidator < ActiveModel::Validator

  def initialize( character )
    @char = character
  end

  def validate
    validate_skills
    validate_attr
  end

  def validate_skills

  end

  def validate_attr
    attrs = [ :attr_agility, :attr_awareness, :attr_brawn, :attr_coordination, :attr_intelligence, :attr_personality, :attr_willpower ]

    ancient_bloodline = false

    attrs.each do |attr|
      val = @char.read_attribute attr

      if val > 14
        @char.errors[:attributes] << "Attribute over 14"
      elsif val > 12
        ancient_bloodline = true
      else
      end
    end
  end
end
