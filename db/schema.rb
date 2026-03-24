# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_24_233431) do
  create_table "productos", force: :cascade do |t|
    t.integer "anio_aprox"
    t.string "categoria", null: false
    t.datetime "created_at", null: false
    t.text "descripcion", null: false
    t.integer "estado", null: false
    t.string "nombre", null: false
    t.decimal "precio_compra", precision: 10, scale: 2, null: false
    t.decimal "precio_venta", precision: 10, scale: 2, null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "uso"
    t.index ["categoria"], name: "index_productos_on_categoria"
    t.index ["estado"], name: "index_productos_on_estado"
    t.index ["user_id"], name: "index_productos_on_user_id"
  end

  create_table "productos_fts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "nombre", null: false
    t.string "password_digest", null: false
    t.integer "rol", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "productos", "users"
  add_foreign_key "sessions", "users"
end
