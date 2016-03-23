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

ActiveRecord::Schema.define(version: 20160323123910) do

  create_table "account_payables", force: :cascade do |t|
    t.integer  "type_account"
    t.integer  "supplier_id"
    t.integer  "cost_center_id"
    t.integer  "payment_method_id"
    t.string   "documento",         limit: 20,                                        null: false
    t.date     "data_vencimento",                                                     null: false
    t.decimal  "valor",                        precision: 10, scale: 2, default: 0.0, null: false
    t.text     "observacao"
    t.integer  "status"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "account_payables", ["cost_center_id"], name: "index_account_payables_on_cost_center_id", using: :btree
  add_index "account_payables", ["data_vencimento"], name: "index_account_payables_on_data_vencimento", using: :btree
  add_index "account_payables", ["documento"], name: "index_account_payables_on_documento", using: :btree
  add_index "account_payables", ["payment_method_id"], name: "index_account_payables_on_payment_method_id", using: :btree
  add_index "account_payables", ["supplier_id"], name: "index_account_payables_on_supplier_id", using: :btree
  add_index "account_payables", ["type_account"], name: "index_account_payables_on_type_account", using: :btree

  create_table "account_receivables", force: :cascade do |t|
    t.integer  "type_account"
    t.integer  "supplier_id"
    t.integer  "cost_center_id"
    t.integer  "payment_method_id"
    t.string   "documento",         limit: 20,                                        null: false
    t.date     "data_vencimento",                                                     null: false
    t.decimal  "valor",                        precision: 10, scale: 2, default: 0.0, null: false
    t.text     "observacao"
    t.integer  "status"
    t.string   "supplier_type"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "account_receivables", ["cost_center_id"], name: "index_account_receivables_on_cost_center_id", using: :btree
  add_index "account_receivables", ["data_vencimento"], name: "index_account_receivables_on_data_vencimento", using: :btree
  add_index "account_receivables", ["documento"], name: "index_account_receivables_on_documento", using: :btree
  add_index "account_receivables", ["payment_method_id"], name: "index_account_receivables_on_payment_method_id", using: :btree
  add_index "account_receivables", ["supplier_id"], name: "index_account_receivables_on_supplier_id", using: :btree
  add_index "account_receivables", ["type_account"], name: "index_account_receivables_on_type_account", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "number",     limit: 5,  null: false
    t.string   "name",       limit: 60, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "cash_accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "bank_id"
    t.string   "agencia"
    t.string   "conta_corrente"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cash_accounts", ["bank_id"], name: "index_cash_accounts_on_bank_id", using: :btree

  create_table "cost_centers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_accounts", force: :cascade do |t|
    t.integer  "cash_account_id"
    t.integer  "cost_center_id"
    t.integer  "tipo",                                                               null: false
    t.date     "data",                                                               null: false
    t.decimal  "valor",                       precision: 10, scale: 2, default: 0.0, null: false
    t.string   "historico",       limit: 250,                                        null: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "current_accounts", ["cash_account_id"], name: "index_current_accounts_on_cash_account_id", using: :btree
  add_index "current_accounts", ["cost_center_id"], name: "index_current_accounts_on_cost_center_id", using: :btree
  add_index "current_accounts", ["data"], name: "index_current_accounts_on_data", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.string   "vtr"
    t.string   "name"
    t.decimal  "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lower_account_receivables", force: :cascade do |t|
    t.integer  "account_receivable_id"
    t.integer  "cash_account_id"
    t.integer  "cost_center_id"
    t.date     "data_pagamento",                                               null: false
    t.decimal  "valor_pago",            precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "juros",                 precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "desconto",              precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "total_pago",            precision: 10, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "lower_account_receivables", ["account_receivable_id"], name: "index_lower_account_receivables_on_account_receivable_id", using: :btree
  add_index "lower_account_receivables", ["cash_account_id"], name: "index_lower_account_receivables_on_cash_account_id", using: :btree
  add_index "lower_account_receivables", ["cost_center_id"], name: "index_lower_account_receivables_on_cost_center_id", using: :btree
  add_index "lower_account_receivables", ["data_pagamento"], name: "index_lower_account_receivables_on_data_pagamento", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "account_payables", "payment_methods"
  add_foreign_key "account_receivables", "payment_methods"
  add_foreign_key "cash_accounts", "banks"
  add_foreign_key "current_accounts", "cash_accounts"
  add_foreign_key "current_accounts", "cost_centers"
end
