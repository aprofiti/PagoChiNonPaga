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

ActiveRecord::Schema.define(version: 20170714090222) do

  create_table "admins", force: :cascade do |t|
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
    t.integer  "polo_id"
    t.boolean  "superadmin"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["polo_id"], name: "index_admins_on_polo_id"
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "carrello", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
  end

  create_table "carrello_prodotti", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "categorie", force: :cascade do |t|
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
    t.integer  "polo_id"
  end

  add_index "citta", ["polo_id"], name: "index_citta_on_polo_id"

  create_table "clienti", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "nome"
    t.string   "cognome"
    t.string   "cf"
    t.date     "data_nascita"
    t.string   "telefono"
    t.string   "indirizzo"
    t.integer  "citta_id"
    t.string   "descrizione_indirizzo"
  end

  add_index "clienti", ["citta_id"], name: "index_clienti_on_citta_id"

  create_table "imprese", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefono"
    t.string   "fax"
    t.string   "giorni_orari"
    t.string   "email"
    t.string   "sitoweb"
    t.string   "facebook"
    t.string   "descrizione"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "verificato"
    t.boolean  "congelato"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "citta_id"
    t.integer  "titolare_id"
    t.string   "indirizzo"
    t.string   "image"
    t.string   "descrizione_indirizzo"
  end

  add_index "imprese", ["citta_id"], name: "index_imprese_on_citta_id"
  add_index "imprese", ["titolare_id"], name: "index_imprese_on_titolare_id"

  create_table "imprese_sottocategorie", id: false, force: :cascade do |t|
    t.integer "impresa_id"
    t.integer "sottocategoria_id"
  end

  add_index "imprese_sottocategorie", ["impresa_id"], name: "index_imprese_sottocategorie_on_impresa_id"
  add_index "imprese_sottocategorie", ["sottocategoria_id"], name: "index_imprese_sottocategorie_on_sottocategoria_id"

  create_table "ordini", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cliente_id"
    t.integer  "impresa_id"
    t.integer  "stato_ordine_id"
    t.float    "totale"
    t.float    "spedizione"
  end

  add_index "ordini", ["cliente_id"], name: "index_ordini_on_cliente_id"
  add_index "ordini", ["impresa_id"], name: "index_ordini_on_impresa_id"
  add_index "ordini", ["stato_ordine_id"], name: "index_ordini_on_stato_ordine_id"
  add_index "ordini", ["totale"], name: "index_ordini_on_totale"

  create_table "ordini_prodotti", id: false, force: :cascade do |t|
    t.integer "ordine_id"
    t.integer "prodotto_id"
    t.integer "qta"
    t.float   "prezzo"
  end

  add_index "ordini_prodotti", ["ordine_id"], name: "index_ordini_prodotti_on_ordine_id"
  add_index "ordini_prodotti", ["prezzo"], name: "index_ordini_prodotti_on_prezzo"
  add_index "ordini_prodotti", ["prodotto_id"], name: "index_ordini_prodotti_on_prodotto_id"

  create_table "poli", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "cap"
    t.string   "telefono"
    t.string   "indirizzo"
    t.string   "sitoweb"
    t.string   "citta_sede"
  end

  create_table "prodotti", force: :cascade do |t|
    t.string   "nome"
    t.float    "prezzo"
    t.integer  "qta"
    t.string   "descrizione"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "impresa_id"
    t.string   "image"
    t.boolean  "eliminato"
  end

  add_index "prodotti", ["impresa_id"], name: "index_prodotti_on_impresa_id"

  create_table "sottocategorie", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "categoria_id"
  end

  add_index "sottocategorie", ["categoria_id"], name: "index_sottocategorie_on_categoria_id"

  create_table "stato_ordini", force: :cascade do |t|
    t.string   "stato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titolari", force: :cascade do |t|
    t.string   "piva"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "nome"
    t.string   "cognome"
    t.string   "cf"
    t.date     "data_nascita"
    t.string   "telefono"
    t.string   "indirizzo"
    t.integer  "citta_id"
    t.string   "email_paypal"
    t.string   "descrizione_indirizzo"
  end

  add_index "titolari", ["citta_id"], name: "index_titolari_on_citta_id"

  create_table "utenti", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "utenti", ["email"], name: "index_utenti_on_email", unique: true
  add_index "utenti", ["reset_password_token"], name: "index_utenti_on_reset_password_token", unique: true

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.text     "object_changes", limit: 1073741823
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id"

end
