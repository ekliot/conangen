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

ActiveRecord::Schema.define(version: 20170222134037) do

  create_table "can_speaks", force: :cascade do |t|
    t.string  "speaker_type"
    t.integer "speaker_id"
    t.integer "language_id"
    t.index ["language_id"], name: "index_can_speaks_on_language_id"
    t.index ["speaker_type", "speaker_id"], name: "index_can_speaks_on_speaker_type_and_speaker_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",        default: ""
    t.integer  "age"
    t.string   "gender",      default: ""
    t.text     "appearance",  default: ""
    t.string   "trait",       default: ""
    t.integer  "standing"
    t.integer  "exp_total",   default: 0
    t.integer  "exp_spent",   default: 0
    t.integer  "attr_agi",    default: 7
    t.integer  "attr_awa",    default: 7
    t.integer  "attr_bra",    default: 7
    t.integer  "attr_coo",    default: 7
    t.integer  "attr_int",    default: 7
    t.integer  "attr_per",    default: 7
    t.integer  "attr_wil",    default: 7
    t.integer  "fortune_max", default: 3
    t.integer  "renown",      default: 0
    t.integer  "gold"
    t.text     "contacts",    default: ""
    t.text     "background",  default: ""
    t.text     "personality", default: ""
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["created_at"], name: "index_characters_on_created_at"
    t.index ["name"], name: "index_characters_on_name"
    t.index ["updated_at"], name: "index_characters_on_updated_at"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "equipment_armours", force: :cascade do |t|
    t.string   "name"
    t.boolean  "head"
    t.boolean  "torso"
    t.boolean  "arm_left"
    t.boolean  "arm_right"
    t.boolean  "leg_left"
    t.boolean  "leg_right"
    t.string   "qualities"
    t.integer  "soak"
    t.string   "type"
    t.integer  "availability"
    t.integer  "cost"
    t.integer  "encumbrance"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "equipment_weapons", force: :cascade do |t|
    t.string  "name"
    t.string  "size"
    t.string  "reach"
    t.integer "damage"
    t.string  "qualities"
    t.integer "cost"
    t.integer "availability"
    t.integer "encumbrance"
    t.string  "category"
    t.string  "subcategory"
    t.index ["availability"], name: "index_equipment_weapons_on_availability"
    t.index ["category"], name: "index_equipment_weapons_on_category"
    t.index ["cost"], name: "index_equipment_weapons_on_cost"
    t.index ["name"], name: "index_equipment_weapons_on_name"
    t.index [nil], name: "index_equipment_weapons_on_type"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "group"
    t.index ["group"], name: "index_languages_on_group"
    t.index ["name"], name: "index_languages_on_name"
  end

  create_table "lifepath_archetype_choices", force: :cascade do |t|
    t.string  "elective1"
    t.string  "elective2"
    t.integer "lifepath_id"
    t.integer "archetype_id"
    t.index ["archetype_id"], name: "index_lifepath_archetype_choices_on_archetype_id"
    t.index ["lifepath_id"], name: "index_lifepath_archetype_choices_on_lifepath_id"
  end

  create_table "lifepath_archetypes", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.text    "skills"
    t.text    "equipment"
    t.integer "talent_id"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_archetypes_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_archetypes_on_sourcebook_id"
    t.index ["talent_id"], name: "index_lifepath_archetypes_on_talent_id"
  end

  create_table "lifepath_aspects", force: :cascade do |t|
    t.string  "name"
    t.text    "attrs"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_aspects_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_aspects_on_sourcebook_id"
  end

  create_table "lifepath_aspects_choices", force: :cascade do |t|
    t.string   "best"
    t.string   "worst"
    t.string   "opt1"
    t.string   "opt2"
    t.integer  "aspect1_id"
    t.integer  "aspect2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aspect1_id"], name: "index_lifepath_aspects_choices_on_aspect1_id"
    t.index ["aspect2_id"], name: "index_lifepath_aspects_choices_on_aspect2_id"
  end

  create_table "lifepath_caste_choices", force: :cascade do |t|
    t.integer "lifepath_id"
    t.integer "caste_id"
    t.index ["caste_id"], name: "index_lifepath_caste_choices_on_caste_id"
    t.index ["lifepath_id"], name: "index_lifepath_caste_choices_on_lifepath_id"
  end

  create_table "lifepath_caste_stories", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.string  "trait"
    t.integer "caste_id"
    t.integer "sourcebook_id"
    t.index ["caste_id"], name: "index_lifepath_caste_stories_on_caste_id"
    t.index ["name"], name: "index_lifepath_caste_stories_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_caste_stories_on_sourcebook_id"
  end

  create_table "lifepath_caste_story_choices", force: :cascade do |t|
    t.integer "lifepath_id"
    t.integer "caste_story_id"
    t.index ["caste_story_id"], name: "index_lifepath_caste_story_choices_on_caste_story_id"
    t.index ["lifepath_id"], name: "index_lifepath_caste_story_choices_on_lifepath_id"
  end

  create_table "lifepath_castes", force: :cascade do |t|
    t.string  "name"
    t.integer "standing"
    t.text    "description"
    t.text    "talents"
    t.integer "skill_id"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_castes_on_name"
    t.index ["skill_id"], name: "index_lifepath_castes_on_skill_id"
    t.index ["sourcebook_id"], name: "index_lifepath_castes_on_sourcebook_id"
  end

  create_table "lifepath_education_choices", force: :cascade do |t|
    t.integer "lifepath_id"
    t.integer "education_id"
    t.index ["education_id"], name: "index_lifepath_education_choices_on_education_id"
    t.index ["lifepath_id"], name: "index_lifepath_education_choices_on_lifepath_id"
  end

  create_table "lifepath_educations", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.text    "skills"
    t.text    "equipment"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_educations_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_educations_on_sourcebook_id"
  end

  create_table "lifepath_homeland_choices", force: :cascade do |t|
    t.string  "language"
    t.integer "lifepath_id"
    t.integer "homeland_id"
    t.index ["homeland_id"], name: "index_lifepath_homeland_choices_on_homeland_id"
    t.index ["lifepath_id"], name: "index_lifepath_homeland_choices_on_lifepath_id"
  end

  create_table "lifepath_homelands", force: :cascade do |t|
    t.string  "name"
    t.integer "talent_id"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_homelands_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_homelands_on_sourcebook_id"
    t.index ["talent_id"], name: "index_lifepath_homelands_on_talent_id"
  end

  create_table "lifepath_lifepaths", force: :cascade do |t|
    t.integer "base_attr",    default: 7
    t.integer "max_attr",     default: 14
    t.integer "max_skill",    default: 5
    t.text    "forbidden"
    t.integer "character_id"
    t.index ["character_id"], name: "index_lifepath_lifepaths_on_character_id"
  end

  create_table "lifepath_nature_choices", force: :cascade do |t|
    t.integer "lifepath_id"
    t.integer "nature_id"
    t.index ["lifepath_id"], name: "index_lifepath_nature_choices_on_lifepath_id"
    t.index ["nature_id"], name: "index_lifepath_nature_choices_on_nature_id"
  end

  create_table "lifepath_natures", force: :cascade do |t|
    t.string  "name"
    t.string  "attr"
    t.text    "description"
    t.text    "skills"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_natures_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_natures_on_sourcebook_id"
  end

  create_table "lifepath_war_stories", force: :cascade do |t|
    t.string  "name"
    t.text    "skills"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_lifepath_war_stories_on_name"
    t.index ["sourcebook_id"], name: "index_lifepath_war_stories_on_sourcebook_id"
  end

  create_table "lifepath_war_story_choices", force: :cascade do |t|
    t.integer "lifepath_id"
    t.integer "war_story_id"
    t.index ["lifepath_id"], name: "index_lifepath_war_story_choices_on_lifepath_id"
    t.index ["war_story_id"], name: "index_lifepath_war_story_choices_on_war_story_id"
  end

  create_table "skill_sets", force: :cascade do |t|
    t.text     "skills"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_skill_sets_on_character_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "parent_attr"
  end

  create_table "sourcebooks", force: :cascade do |t|
    t.string "title"
    t.index ["title"], name: "index_sourcebooks_on_title"
  end

  create_table "talents_prereq_skills", force: :cascade do |t|
    t.integer "min_exp"
    t.integer "min_foc"
    t.integer "requirer_id"
    t.integer "required_id"
    t.index ["required_id"], name: "index_talents_prereq_skills_on_required_id"
    t.index ["requirer_id"], name: "index_talents_prereq_skills_on_requirer_id"
  end

  create_table "talents_prereq_talents", force: :cascade do |t|
    t.boolean "mandatory"
    t.integer "min_rank"
    t.integer "required_id"
    t.integer "requirer_id"
    t.index ["required_id"], name: "index_talents_prereq_talents_on_required_id"
    t.index ["requirer_id"], name: "index_talents_prereq_talents_on_requirer_id"
  end

  create_table "talents_talent_buys", force: :cascade do |t|
    t.integer  "xp_spent"
    t.string   "source"
    t.string   "variant"
    t.integer  "talent_id"
    t.integer  "talent_set_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["talent_set_id"], name: "index_talents_talent_buys_on_talent_set_id"
  end

  create_table "talents_talent_sets", force: :cascade do |t|
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_talents_talent_sets_on_character_id"
  end

  create_table "talents_talents", force: :cascade do |t|
    t.string  "name"
    t.string  "tree"
    t.integer "max_ranks",     default: 1
    t.text    "description"
    t.text    "variants"
    t.integer "skill_id"
    t.integer "sourcebook_id"
    t.index ["name"], name: "index_talents_talents_on_name"
    t.index ["skill_id"], name: "index_talents_talents_on_skill_id"
    t.index ["sourcebook_id"], name: "index_talents_talents_on_sourcebook_id"
    t.index ["tree"], name: "index_talents_talents_on_tree"
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
