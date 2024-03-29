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

ActiveRecord::Schema.define(version: 20150510153834) do

  create_table "carte_types", force: true do |t|
    t.string   "libelle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cartes", force: true do |t|
    t.string   "libelle"
    t.integer  "carte_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "edition_id"
    t.integer  "niveau"
    t.integer  "tresor"
    t.string   "incident"
    t.integer  "famille_carte_id"
    t.integer  "valeur"
    t.string   "precombat"
  end

  add_index "cartes", ["carte_type_id"], name: "index_cartes_on_carte_type_id", using: :btree
  add_index "cartes", ["edition_id"], name: "index_cartes_on_edition_id", using: :btree
  add_index "cartes", ["famille_carte_id"], name: "index_cartes_on_famille_carte_id", using: :btree

  create_table "compteurs", force: true do |t|
    t.string   "libelle"
    t.integer  "edition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "compteurs", ["edition_id"], name: "index_compteurs_on_edition_id", using: :btree

  create_table "editions", force: true do |t|
    t.string   "libelle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "famille_cartes", force: true do |t|
    t.string   "libelle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "approved",               default: false, null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
