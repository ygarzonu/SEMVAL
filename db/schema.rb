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
    t.text     "contenido"
    t.integer  "indicador_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["indicador_id"], name: "index_comments_on_indicador_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "indicadors", force: :cascade do |t|
    t.string   "variableM"
    t.string   "nombre"
    t.string   "tipo"
    t.string   "unidad"
    t.string   "sentido"
    t.integer  "importancia"
    t.integer  "meta"
    t.integer  "meses"
    t.integer  "estadoA"
    t.integer  "peorE"
    t.string   "formula"
    t.text     "fuente"
    t.date     "fechaI"
    t.date     "fechaC"
    t.integer  "objetivo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "indicadors", ["objetivo_id"], name: "index_indicadors_on_objetivo_id"

  create_table "indicadors_variables", id: false, force: :cascade do |t|
    t.integer "variable_id",  null: false
    t.integer "indicador_id", null: false
  end

  create_table "loginds", force: :cascade do |t|
    t.integer  "meta"
    t.integer  "estado"
    t.integer  "peorE"
    t.date     "fechaM"
    t.date     "fechaC"
    t.integer  "valor"
    t.integer  "valorP"
    t.integer  "indicador_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "loginds", ["indicador_id"], name: "index_loginds_on_indicador_id"

  create_table "logpros", force: :cascade do |t|
    t.integer  "meta"
    t.integer  "estado"
    t.integer  "peorE"
    t.date     "fechaM"
    t.date     "fechaC"
    t.integer  "valor"
    t.integer  "valorP"
    t.integer  "proceso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logpros", ["proceso_id"], name: "index_logpros_on_proceso_id"

  create_table "logvars", force: :cascade do |t|
    t.integer  "valor"
    t.date     "fechaD"
    t.integer  "variable_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "logvars", ["variable_id"], name: "index_logvars_on_variable_id"

  create_table "objetivos", force: :cascade do |t|
    t.text     "ObjetivoV"
    t.integer  "proceso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "objetivos", ["proceso_id"], name: "index_objetivos_on_proceso_id"

  create_table "procesos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "importancia"
    t.text     "objetivo"
    t.integer  "meta"
    t.date     "fechaI"
    t.date     "fechaC"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "procesos", ["user_id"], name: "index_procesos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name1",                               null: false
    t.string   "name2"
    t.string   "ape1",                                null: false
    t.string   "ape2"
    t.string   "email",                               null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "permission_level",       default: 1,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "variables", force: :cascade do |t|
    t.string   "nombre"
    t.string   "valorPerAnt"
    t.integer  "indicador_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "variables", ["indicador_id"], name: "index_variables_on_indicador_id"

end
