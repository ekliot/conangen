class Character < ApplicationRecord

  # =============
  # ASSOCIATIONS

  belongs_to :user

  has_one :lifepath, dependent: :destroy, inverse_of: :lifepath
  has_one :talent_set, dependent: :destroy, validate: true, inverse_of: :talent_set

  # =============
  # SERIALIZATION

  serialize :soak, Hash       # { courage: Int, armor: { head: Int, arm_left: Int, arm_right: Int, torso: Int, leg_left: Int, leg_right: Int, qualities: String } }
  serialize :health, Hash     # { stress: { max: { vigor: Int, resolve: Int }, current: { vigor: Int, resolve: Int } }, harm: { wounds: Int, trauma: Int } }
  serialize :damage, Hash     # { melee: Int, ranged: Int, presence: Int }
  serialize :skills, Hash     # { acrobatics: { exp: Int, foc: Int }, ... , warfare: { exp: Int, foc: Int } }
  serialize :attr_stats, Hash # { agility: Int, awareness: Int, brawn: Int, coordination: Int, intelligence: Int, personality: Int, willpower: Int }
  serialize :languages, Array # [ "Cimmerian", "Hyrkanian", ... "Aquilonian" ]

  # =============
  # VALIDATION

  validate on: :create do |character|
    NewCharValidator.new( character ).validate
  end

  validates :name, presence: true, format: {  with: /\A[a-zA-Z\-']+\z/,
                                              message: "only allows letters, apostrophes, and hyphens" }
  validates :trait, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :standing, presence: true
  validates :gold, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :exp_total, minimum: 0
  validates :exp_spent, maximum: :exp_total

  # =============
  # CALLBACKS

  after_initialize do |character|
    default_skills = {
      acrobatics:       { exp: 0, foc: 0 },
      alchemy:          { exp: 0, foc: 0 },
      animal_handling:  { exp: 0, foc: 0 },
      athletics:        { exp: 0, foc: 0 },
      command:          { exp: 0, foc: 0 },
      counsel:          { exp: 0, foc: 0 },
      craft:            { exp: 0, foc: 0 },
      discipline:       { exp: 0, foc: 0 },
      healing:          { exp: 0, foc: 0 },
      insight:          { exp: 0, foc: 0 },
      linguistics:      { exp: 0, foc: 0 },
      lore:             { exp: 0, foc: 0 },
      melee:            { exp: 0, foc: 0 },
      observation:      { exp: 0, foc: 0 },
      parry:            { exp: 0, foc: 0 },
      persuade:         { exp: 0, foc: 0 },
      ranged:           { exp: 0, foc: 0 },
      resistance:       { exp: 0, foc: 0 },
      sailing:          { exp: 0, foc: 0 },
      society:          { exp: 0, foc: 0 },
      sorcery:          { exp: 0, foc: 0 },
      stealth:          { exp: 0, foc: 0 },
      survival:         { exp: 0, foc: 0 },
      thievery:         { exp: 0, foc: 0 },
      warfare:          { exp: 0, foc: 0 },
    }

    base_attr = {
      agility: 7, awareness: 7, brawn: 7,
      coordination: 7, intelligence: 7,
      personality: 7, willpower: 7
    }

    armor_loc = {
                    head: 0,
      left_arm: 0, torso: 0, right_arm: 0,
          left_leg: 0, right_leg: 0,
                qualities: ""
    }

    soak = {
      courage: 0, armor: armor_loc,
      # cover rolls?
    }

    damage = { melee: 0, ranged: 0, presence: 0 }

    health = {
      stress: {
        max:      { vigor: 0, resolve: 0 },
        current:  { vigor: 0, resolve: 0 }
      },

      harm: { wounds: 5, trauma: 5 }
    }

    character.skills = default_skills

    character.attr_stats = base_attr

    character.soak = soak

    character.damage = damage

    character.health = health

    character.lifepath = Lifepath::Lifepath.create

    character.talent_set = TalentSet.create
  end

  def derive_health
  end

  def derive_soak
  end

  def derive_damage
  end
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
    skills = @char.skills

    over_3_count = 0

    skills.each do |skill|
      exp = skills[:exp]
      foc = skills[:foc]

      if foc != exp
        @char.errors[:skills] << ( skill + "'s expertise and focus must be equal for a new character" )
      else
        if foc > 5
          @char.errors[:skills] << "A skill cannot have a bonus greater than 5"
        end

        if foc > 3
          over_3_count.next
        end
      end
    end

    if over_3_count > 3
      @char.errors[:skills] << "Cannot have more than three skills with bonuses greater than 3"
    end
  end

  def validate_attr
    attrs = @char.attr_stats

    attrs.each do |val|
      if val > 14
        @char.errors[:attributes] << "Attribute cannot be greater than 14"
      end
    end
  end
end
