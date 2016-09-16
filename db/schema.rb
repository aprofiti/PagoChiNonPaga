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

ActiveRecord::Schema.define(version: 20160916122708) do

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "categoria", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citta", force: :cascade do |t|
    t.string   "nome"
    t.string   "provincia"
    t.string   "regione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clienti", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imprese", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefono"
    t.string   "fax"
    t.string   "giorni_orari"
    t.string   "email"
    t.string   "sitoweb"
    t.string   "facebook"
    t.string   "descrizione"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "verificato"
    t.boolean  "congelato"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "indirizzi", force: :cascade do |t|
    t.string   "via"
    t.integer  "ncivico"
    t.string   "cap"
    t.string   "quartiere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordini", force: :cascade do |t|
    t.datetime "data"
    t.string   "stato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prodotti", force: :cascade do |t|
    t.string   "nome"
    t.float    "prezzo"
    t.integer  "qta"
    t.string   "descrizione"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sottocategoria", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titolares", force: :cascade do |t|
    t.string   "partitaIva"
    t.date     "dataNascita"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "titolari", force: :cascade do |t|
    t.string   "piva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "utentes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cognome"
    t.string   "codicefiscale"
    t.string   "telefono"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "utentes", ["email"], name: "index_utentes_on_email", unique: true
  add_index "utentes", ["reset_password_token"], name: "index_utentes_on_reset_password_token", unique: true

  create_table "utenti", force: :cascade do |t|
    t.string   "nome"
    t.string   "cognome"
    t.string   "cf"
    t.date     "data_nascita"
    t.string   "telefono"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "actable_id"
    t.string   "actable_type"
  end

  add_index "utenti", ["email"], name: "index_utenti_on_email", unique: true
  add_index "utenti", ["reset_password_token"], name: "index_utenti_on_reset_password_token", unique: true

end
