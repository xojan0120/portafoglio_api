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

ActiveRecord::Schema.define(version: 20190509115418) do

  create_table "reactions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_reactions_on_name", unique: true
  end

  create_table "site_reactions", force: :cascade do |t|
    t.integer "site_id"
    t.integer "reaction_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reaction_id"], name: "index_site_reactions_on_reaction_id"
    t.index ["site_id", "reaction_id", "user_id"], name: "index_site_reactions_on_site_id_and_reaction_id_and_user_id", unique: true
    t.index ["site_id"], name: "index_site_reactions_on_site_id"
    t.index ["user_id"], name: "index_site_reactions_on_user_id"
  end

  create_table "site_skills", force: :cascade do |t|
    t.integer "site_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_site_skills_on_site_id"
    t.index ["skill_id"], name: "index_site_skills_on_skill_id"
  end

  create_table "sites", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "url"
    t.integer "creation_period"
    t.integer "creation_period_unit_id"
    t.string "comment"
    t.string "screenshot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_units_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.integer "count"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_views_on_site_id"
  end

end
