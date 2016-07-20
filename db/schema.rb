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

ActiveRecord::Schema.define(version: 20160704170559) do

  create_table "characters", force: :cascade do |t|
    t.string   "name",        default: ""
    t.integer  "age"
    t.string   "gender",      default: ""
    t.text     "appearance",  default: ""
    t.string   "trait",       default: ""
    t.integer  "exp_total",   default: 0
    t.integer  "exp_spent",   default: 0
    t.integer  "fortune_max", default: 3
    t.integer  "gold"
    t.integer  "renown",      default: 0
    t.integer  "standing"
    t.text     "contacts",    default: ""
    t.text     "background",  default: ""
    t.text     "personality", default: ""
    t.text     "soak",        default: ""
    t.text     "health",      default: ""
    t.text     "damage",      default: ""
    t.text     "skills",      default: ""
    t.text     "languages",   default: ""
    t.text     "attr_stats",  default: ""
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["created_at"], name: "index_characters_on_created_at"
    t.index ["name"], name: "index_characters_on_name"
    t.index ["updated_at"], name: "index_characters_on_updated_at"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "equipment_weapons", force: :cascade do |t|
    t.string  "name"
    t.integer "cost"
    t.string  "reach"
    t.string  "size"
    t.string  "qualities"
    t.string  "category"
    t.integer "damage"
    t.integer "availability"
    t.integer "encumbrance"
    t.string  "type"
    t.index ["availability"], name: "index_equipment_weapons_on_availability"
    t.index ["category"], name: "index_equipment_weapons_on_category"
    t.index ["cost"], name: "index_equipment_weapons_on_cost"
    t.index ["name"], name: "index_equipment_weapons_on_name"
    t.index ["type"], name: "index_equipment_weapons_on_type"
  end

  create_table "lifepath_archetypes", force: :cascade do |t|
    t.string  "name"
    t.string  "skill_career"
    t.string  "skill_mandatory1"
    t.string  "skill_mandatory2"
    t.string  "skill_mandatory3"
    t.string  "skill_mandatory4"
    t.string  "skill_elective1"
    t.string  "skill_elective2"
    t.string  "skill_elective3"
    t.text    "equipment"
    t.text    "description"
    t.integer "talent_id"
    t.index ["name"], name: "index_lifepath_archetypes_on_name"
  end

  create_table "lifepath_aspects", force: :cascade do |t|
    t.string "name"
    t.string "mandatory_attribute1"
    t.string "mandatory_attribute2"
    t.string "optional_attribute1"
    t.string "optional_attribute2"
    t.index ["name"], name: "index_lifepath_aspects_on_name"
  end

  create_table "lifepath_caste_stories", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.string  "trait"
    t.integer "caste_id"
    t.index ["caste_id"], name: "index_lifepath_caste_stories_on_caste_id"
    t.index ["name"], name: "index_lifepath_caste_stories_on_name"
  end

  create_table "lifepath_castes", force: :cascade do |t|
    t.string  "name"
    t.string  "skill"
    t.integer "social_standing"
    t.text    "description"
    t.text    "talents"
    t.index ["name"], name: "index_lifepath_castes_on_name"
  end

  create_table "lifepath_educations", force: :cascade do |t|
    t.string "name"
    t.string "skill_mandatory1"
    t.string "skill_mandatory2"
    t.string "skill_mandatory3"
    t.string "skill_elective1"
    t.string "skill_elective2"
    t.string "skill_elective3"
    t.text   "equipment"
    t.text   "description"
    t.index ["name"], name: "index_lifepath_educations_on_name"
  end

  create_table "lifepath_homelands", force: :cascade do |t|
    t.string  "name"
    t.string  "language"
    t.integer "talent_id"
    t.index ["name"], name: "index_lifepath_homelands_on_name"
  end

  create_table "lifepath_lifepaths", force: :cascade do |t|
    t.integer "character_id"
    t.integer "homeland_id"
    t.integer "caste_id"
    t.integer "story_caste_id"
    t.integer "archetype_id"
    t.integer "nature_id"
    t.integer "education_id"
    t.integer "story_war_id"
    t.index ["character_id"], name: "index_lifepath_lifepaths_on_character_id"
  end

  create_table "lifepath_natures", force: :cascade do |t|
    t.string "name"
    t.string "attr"
    t.string "skill_mandatory1"
    t.string "skill_mandatory2"
    t.string "skill_mandatory3"
    t.string "skill_elective1"
    t.string "skill_elective2"
    t.string "skill_elective3"
    t.text   "description"
    t.index ["name"], name: "index_lifepath_natures_on_name"
  end

  create_table "lifepath_war_stories", force: :cascade do |t|
    t.string "name"
    t.string "skill1"
    t.string "skill2"
    t.index ["name"], name: "index_lifepath_war_stories_on_name"
  end

  create_table "talent_sets", force: :cascade do |t|
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_talent_sets_on_character_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string  "name"
    t.string  "skill"
    t.integer "max_ranks",   default: 1
    t.text    "description"
    t.text    "pre_skills"
    t.text    "pre_talents"
    t.index ["name"], name: "index_talents_on_name"
    t.index ["skill"], name: "index_talents_on_skill"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
