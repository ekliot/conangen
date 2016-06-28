# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160628203123) do

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.text     "appearance"
    t.text     "personality"
    t.string   "homeland"
    t.string   "caste"
    t.string   "caste_story"
    t.string   "trait"
    t.string   "archetype"
    t.string   "nature"
    t.string   "education"
    t.string   "warstory"
    t.integer  "exp_total"
    t.integer  "exp_spent"
    t.integer  "fortune_max"
    t.integer  "fortune_current"
    t.integer  "gold"
    t.integer  "renown"
    t.integer  "standing"
    t.integer  "attr_agility"
    t.integer  "attr_awareness"
    t.integer  "attr_brawn"
    t.integer  "attr_coordination"
    t.integer  "attr_intelligence"
    t.integer  "attr_personality"
    t.integer  "attr_willpower"
    t.integer  "dmg_ranged"
    t.integer  "dmg_melee"
    t.integer  "dmg_presence"
    t.integer  "courage"
    t.integer  "armour_head"
    t.integer  "armour_rarm"
    t.integer  "armour_larm"
    t.integer  "armour_rleg"
    t.integer  "armour_lleg"
    t.integer  "armour_torso"
    t.string   "armour_qualities"
    t.integer  "vigor_max"
    t.integer  "vigor_current"
    t.integer  "resolve_max"
    t.integer  "resolve_current"
    t.integer  "wounds_current"
    t.integer  "trauma_current"
    t.string   "talent_homeland"
    t.string   "talent_caste1"
    t.string   "talent_caste2"
    t.text     "contacts"
    t.text     "background"
    t.string   "languages"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "skill_sets", force: :cascade do |t|
    t.integer  "acrobatics_exp"
    t.integer  "acrobatics_foc"
    t.integer  "alchemy_exp"
    t.integer  "alchemy_foc"
    t.integer  "animalhand_exp"
    t.integer  "animalhand_foc"
    t.integer  "athletics_exp"
    t.integer  "athletics_foc"
    t.integer  "command_exp"
    t.integer  "command_foc"
    t.integer  "counsel_exp"
    t.integer  "counsel_foc"
    t.integer  "craft_exp"
    t.integer  "craft_foc"
    t.integer  "discipline_exp"
    t.integer  "discipline_foc"
    t.integer  "healing_exp"
    t.integer  "healing_foc"
    t.integer  "insight_exp"
    t.integer  "insight_foc"
    t.integer  "linguistics_exp"
    t.integer  "linguistics_foc"
    t.integer  "lore_exp"
    t.integer  "lore_foc"
    t.integer  "melee_exp"
    t.integer  "melee_foc"
    t.integer  "observation_exp"
    t.integer  "observation_foc"
    t.integer  "parry_exp"
    t.integer  "parry_foc"
    t.integer  "persuade_exp"
    t.integer  "persuade_foc"
    t.integer  "ranged_exp"
    t.integer  "ranged_foc"
    t.integer  "resistance_exp"
    t.integer  "resistance_foc"
    t.integer  "sailing_exp"
    t.integer  "sailing_foc"
    t.integer  "siegecraft_exp"
    t.integer  "siegecraft_foc"
    t.integer  "society_exp"
    t.integer  "society_foc"
    t.integer  "sorcery_exp"
    t.integer  "stealth_exp"
    t.integer  "stealth_foc"
    t.integer  "survival_exp"
    t.integer  "survival_foc"
    t.integer  "thievery_exp"
    t.integer  "thievery_foc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "talents", force: :cascade do |t|
    t.string   "name"
    t.integer  "max_ranks"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
