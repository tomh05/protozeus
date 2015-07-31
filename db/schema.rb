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

ActiveRecord::Schema.define(version: 20150731155308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atom_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atoms", force: :cascade do |t|
    t.string   "content"
    t.string   "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "url"
    t.integer  "atom_type_id"
    t.string   "title"
  end

  add_index "atoms", ["atom_type_id"], name: "index_atoms_on_atom_type_id", using: :btree

  create_table "card_instance_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "card_instance_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "card_instance_anc_desc_idx", unique: true, using: :btree
  add_index "card_instance_hierarchies", ["descendant_id"], name: "card_instance_desc_idx", using: :btree

  create_table "card_instances", force: :cascade do |t|
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.integer  "sort_order"
    t.integer  "article_id"
  end

  add_index "card_instances", ["article_id"], name: "index_card_instances_on_article_id", using: :btree
  add_index "card_instances", ["card_id"], name: "index_card_instances_on_card_id", using: :btree

  create_table "card_parameters", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "card_id"
    t.integer  "atom_id"
  end

  add_index "card_parameters", ["atom_id"], name: "index_card_parameters_on_atom_id", using: :btree
  add_index "card_parameters", ["card_id"], name: "index_card_parameters_on_card_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "template_id"
  end

  add_index "cards", ["template_id"], name: "index_cards_on_template_id", using: :btree

  create_table "template_parameters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "param_type"
    t.integer  "template_id"
  end

  add_index "template_parameters", ["template_id"], name: "index_template_parameters_on_template_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atoms", "atom_types"
  add_foreign_key "card_instances", "articles"
  add_foreign_key "card_instances", "cards"
  add_foreign_key "card_parameters", "atoms"
  add_foreign_key "card_parameters", "cards"
  add_foreign_key "cards", "templates"
  add_foreign_key "template_parameters", "templates"
end
