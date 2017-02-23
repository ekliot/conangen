class Character < ApplicationRecord

  # === RELATIONS ==============================================================

  belongs_to :user

  has_one :lifepath,   dependent: :destroy, inverse_of: :lifepath

  # talent relations
  has_one :talent_set, dependent: :destroy, inverse_of: :talent_set, validate: true
  # has_many :talent_buys, dependent: :destroy, :through => :talent_set
  # has_many :talents, dependent: :destroy, :through => :talent_buys

  # skill relations
  has_one :skill_set, dependent: :destroy, inverse_of: :skill_set, validate: true

  # language relations
  has_many :can_speaks, as: :speaker, dependent: :destroy
  has_many :languages, :through => :can_speaks

  # === SERIALIZATION ==========================================================

  # serialize :soak,       Hash # { courage: Int, armor: { head: Int, arm_left: Int, arm_right: Int, torso: Int, leg_left: Int, leg_right: Int, qualities: String } }
  # serialize :health,     Hash # { stress: { max: { vigor: Int, resolve: Int }, current: { vigor: Int, resolve: Int } }, harm: { wounds: Int, trauma: Int } }
  # serialize :damage,     Hash # { melee: Int, ranged: Int, presence: Int }
  # serialize :attr_stats, Hash # { agility: Int, awareness: Int, brawn: Int, coordination: Int, intelligence: Int, personality: Int, willpower: Int }

  # === VALIDATION =============================================================

  validate on: :create do |character|
    NewCharValidator.new( character ).validate
  end

  validates :name,     presence: true, format: {  with: /\A[a-zA-Z\-']+\z/,
                                                  message: "only allows letters, apostrophes, and hyphens" }
  validates :trait,    presence: true
  validates :age,      presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :standing, presence: true
  validates :gold,     presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :exp_total, minimum: 0
  validates :exp_spent, maximum: :exp_total

  # === CALLBACKS ==============================================================

  # after_initialize do |character|
  #   character.lifepath = Lifepath::Lifepath.create
  #
  #   character.talent_set = TalentSet.create
  # end

  # === METHODS ================================================================

  def get_attr_hash
    { Agility:      @char.attr_agi,
      Awareness:    @char.attr_awa,
      Brawn:        @char.attr_bra,
      Coordination: @char.attr_coo,
      Intelligence: @char.attr_int,
      Perception:   @char.attr_per,
      Willpower:    @char.attr_wil }
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
    skills = @char.skill_set

    over_3_count = 0

    skills.each do |skill|
      exp = skills[:exp]
      foc = skills[:foc]

      if foc != exp
        @char.errors[:skills] << ( "#{skill}'s expertise and focus must be equal for a new character (got: exp #{exp} :: foc #{foc})" )
      else
        if foc > 5
          @char.errors[:skills] << "A skill cannot have a bonus greater than 5 (offending skill: #{skill} with exp #{exp} and foc #{foc})"
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
    attrs = @char.get_attr_hash

    attrs.each do |att, val|
      if val > 14
        @char.errors[:attributes] << "Attribute cannot be greater than 14 (got: #{att} #{val})"
      end
    end
  end
end
