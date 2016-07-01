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

ActiveRecord::Schema.define(version: 20160630225818) do

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.text     "appearance"
    t.text     "personality"
    t.string   "trait"
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
    t.text     "contacts"
    t.text     "background"
    t.string   "languages"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "characters", ["name"], name: "index_characters_on_name"
  add_index "characters", ["user_id"], name: "index_characters_on_user_id"
  add_index "characters", [nil], name: "index_characters_on_created_on"
  add_index "characters", [nil], name: "index_characters_on_updated_on"

  create_table "equipment_weapons", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.string   "reach"
    t.string   "size"
    t.string   "qualities"
    t.integer  "damage"
    t.integer  "availability"
    t.integer  "encumbrance"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lifepath_archetypes", force: :cascade do |t|
    t.string   "name"
    t.string   "skill_career"
    t.string   "skill_mandatory1"
    t.string   "skill_mandatory2"
    t.string   "skill_mandatory3"
    t.string   "skill_mandatory4"
    t.string   "skill_elective1"
    t.string   "skill_elective2"
    t.string   "skill_elective3"
    t.text     "equipment"
    t.integer  "talents_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "lifepath_castes", force: :cascade do |t|
    t.string   "name"
    t.string   "skill"
    t.integer  "social_standing"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lifepath_educations", force: :cascade do |t|
    t.string   "name"
    t.string   "skill_mandatory1"
    t.string   "skill_mandatory2"
    t.string   "skill_mandatory3"
    t.string   "skill_elective1"
    t.string   "skill_elective2"
    t.string   "skill_elective3"
    t.text     "equipment"
    t.integer  "talent_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "lifepath_homelands", force: :cascade do |t|
    t.string   "name"
    t.string   "language"
    t.integer  "talent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifepath_natures", force: :cascade do |t|
    t.string   "name"
    t.string   "attribute"
    t.string   "skill_mandatory1"
    t.string   "skill_mandatory2"
    t.string   "skill_mandatory3"
    t.string   "skill_elective1"
    t.string   "skill_elective2"
    t.string   "skill_elective3"
    t.integer  "talent_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "lifepath_story_castes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "trait"
    t.integer  "castes_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lifepath_story_castes", [nil], name: "index_lifepath_story_castes_on_caste_id"

  create_table "lifepath_story_wars", force: :cascade do |t|
    t.string   "name"
    t.string   "skill1"
    t.string   "skill2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifepaths", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "mod_agility"
    t.integer  "mod_awareness"
    t.integer  "mod_brawn"
    t.integer  "mod_coordination"
    t.integer  "mod_intelligence"
    t.integer  "mod_personality"
    t.integer  "mod_willpower"
    t.integer  "character_id"
    t.integer  "homeland_id"
    t.integer  "caste_id"
    t.integer  "story_caste_id"
    t.integer  "archetype_id"
    t.integer  "nature_id"
    t.integer  "education_id"
    t.integer  "story_war_id"
  end

  add_index "lifepaths", [nil], name: "index_lifepaths_on_user_id"

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
    t.integer  "character_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "skill_sets", ["character_id"], name: "index_skill_sets_on_character_id"
  add_index "skill_sets", ["created_at"], name: "index_skill_sets_on_created_at"
  add_index "skill_sets", ["updated_at"], name: "index_skill_sets_on_updated_at"
  add_index "skill_sets", [nil], name: "index_skill_sets_on_name"

  create_table "talent_sets", force: :cascade do |t|
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "talent_sets", [nil], name: "index_talent_sets_on_user_id"

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
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
