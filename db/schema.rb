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

ActiveRecord::Schema.define(version: 20160121221747) do

  create_table "comments", force: :cascade do |t|
    t.text     "contenido",    limit: 65535
    t.integer  "indicador_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["indicador_id"], name: "index_comments_on_indicador_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "indicadors", force: :cascade do |t|
    t.string   "variableM",   limit: 255
    t.string   "nombre",      limit: 255
    t.string   "tipo",        limit: 255
    t.string   "unidad",      limit: 255
    t.string   "sentido",     limit: 255
    t.integer  "importancia", limit: 4
    t.integer  "meta",        limit: 4
    t.integer  "meses",       limit: 4
    t.integer  "estadoA",     limit: 4
    t.integer  "peorE",       limit: 4
    t.string   "formula",     limit: 255
    t.text     "fuente",      limit: 65535
    t.date     "fechaI"
    t.date     "fechaC"
    t.integer  "objetivo_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "indicadors", ["objetivo_id"], name: "id_idx", using: :btree

  create_table "indicadors_variables", id: false, force: :cascade do |t|
    t.integer "variable_id",  limit: 4, null: false
    t.integer "indicador_id", limit: 4, null: false
  end

  create_table "loginds", force: :cascade do |t|
    t.integer  "meta",         limit: 4
    t.integer  "estado",       limit: 4
    t.integer  "mes",          limit: 4
    t.integer  "peorE",        limit: 4
    t.date     "fechaM"
    t.date     "fechaC"
    t.integer  "valor",        limit: 4
    t.integer  "valorP",       limit: 4
    t.integer  "indicador_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "loginds", ["indicador_id"], name: "index_loginds_on_indicador_id", using: :btree

  create_table "logpros", force: :cascade do |t|
    t.integer  "meta",       limit: 4
    t.integer  "estado",     limit: 4
    t.integer  "mes",        limit: 4
    t.integer  "peorE",      limit: 4
    t.date     "fechaM"
    t.date     "fechaC"
    t.integer  "valor",      limit: 4
    t.integer  "valorP",     limit: 4
    t.integer  "proceso_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "logpros", ["proceso_id"], name: "index_logpros_on_proceso_id", using: :btree

  create_table "logvars", force: :cascade do |t|
    t.integer  "valor",       limit: 4
    t.date     "fechaD"
    t.integer  "variable_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "logvars", ["variable_id"], name: "index_logvars_on_variable_id", using: :btree

  create_table "objetivos", force: :cascade do |t|
    t.string   "objetivoV",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "proceso_id", limit: 4,   null: false
  end

  add_index "objetivos", ["proceso_id"], name: "id", using: :btree

  create_table "procesos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.integer  "importancia", limit: 4
    t.text     "objetivo",    limit: 65535
    t.integer  "meta",        limit: 4
    t.date     "fechaI"
    t.date     "fechaC"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "procesos", ["user_id"], name: "id_idx", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name1",                  limit: 255,              null: false
    t.string   "name2",                  limit: 255
    t.string   "ape1",                   limit: 255,              null: false
    t.string   "ape2",                   limit: 255
    t.string   "email",                  limit: 255,              null: false
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "permission_level",       limit: 4,   default: 4,  null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "variables", force: :cascade do |t|
    t.string   "nombre",       limit: 255
    t.string   "unidad",       limit: 15
    t.string   "valorPerAnt",  limit: 255
    t.integer  "indicador_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "variables", ["indicador_id"], name: "id_idx", using: :btree

  add_foreign_key "comments", "indicadors"
  add_foreign_key "comments", "users"
  add_foreign_key "indicadors", "objetivos", name: "objetivo_id"
  add_foreign_key "loginds", "indicadors"
  add_foreign_key "logpros", "procesos"
  add_foreign_key "logvars", "variables"
  add_foreign_key "procesos", "users", name: "id"
  add_foreign_key "variables", "indicadors", name: "indicador_id"
end
