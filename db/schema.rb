# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_11_044641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cow_dairies", force: :cascade do |t|
    t.bigint "cow_id", null: false
    t.bigint "dairy_id", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cow_id"], name: "index_cow_dairies_on_cow_id"
    t.index ["dairy_id"], name: "index_cow_dairies_on_dairy_id"
    t.index ["user_id"], name: "index_cow_dairies_on_user_id"
  end

  create_table "cow_shades", force: :cascade do |t|
    t.bigint "cow_id", null: false
    t.bigint "shade_id", null: false
    t.boolean "active", default: true
    t.integer "created_by"
    t.integer "deactivated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cow_id"], name: "index_cow_shades_on_cow_id"
    t.index ["created_by", "deactivated_by"], name: "index_cow_shades_on_created_by_and_deactivated_by"
    t.index ["shade_id"], name: "index_cow_shades_on_shade_id"
  end

  create_table "cows", force: :cascade do |t|
    t.string "name", null: false
    t.date "dob"
    t.string "breed"
    t.boolean "female", default: true
    t.integer "created_by"
    t.bigint "dairy_id", null: false
    t.integer "birth_by"
    t.integer "photo_id"
    t.boolean "active", default: true
    t.text "deactivation_reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_by"], name: "index_cows_on_birth_by"
    t.index ["created_by"], name: "index_cows_on_created_by"
    t.index ["dairy_id"], name: "index_cows_on_dairy_id"
    t.index ["photo_id"], name: "index_cows_on_photo_id"
  end

  create_table "dairies", force: :cascade do |t|
    t.string "name", null: false
    t.text "desc", null: false
    t.integer "user_id"
    t.boolean "active", default: true
    t.string "country"
    t.string "county"
    t.integer "geolocation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geolocation_id"], name: "index_dairies_on_geolocation_id"
    t.index ["name"], name: "index_dairies_on_name", unique: true
    t.index ["user_id"], name: "index_dairies_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "username", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "phone_token"
    t.string "email_token"
    t.bigint "dairy_id"
    t.bigint "user_id"
    t.integer "inviter"
    t.integer "invitation_role"
    t.boolean "confirmed_by_phone"
    t.datetime "phone_confirmed_time"
    t.boolean "confirmed_by_email"
    t.datetime "email_confirmed_time"
    t.datetime "admin_confirmed_at"
    t.boolean "admin_confirmed", default: false
    t.integer "admin_confirmed_by"
    t.boolean "revoked_invite", default: false
    t.integer "invite_revoked_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dairy_id"], name: "index_invitations_on_dairy_id"
    t.index ["email_token"], name: "index_invitations_on_email_token", unique: true
    t.index ["invitation_role"], name: "index_invitations_on_invitation_role"
    t.index ["invite_revoked_by"], name: "index_invitations_on_invite_revoked_by"
    t.index ["inviter"], name: "index_invitations_on_inviter"
    t.index ["phone_token"], name: "index_invitations_on_phone_token", unique: true
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "milking_times", force: :cascade do |t|
    t.string "milking_timeable_id"
    t.string "milking_timeable_type"
    t.time "first_milking"
    t.time "second_milking"
    t.time "third_milking"
    t.time "fourth_milking"
    t.integer "milking_count"
    t.boolean "active", default: true
    t.integer "created_by"
    t.integer "deactivated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by", "deactivated_by"], name: "index_milking_times_on_created_by_and_deactivated_by"
  end

  create_table "milkings", force: :cascade do |t|
    t.bigint "cow_id", null: false
    t.string "type"
    t.bigint "milking_time_id"
    t.float "quantity"
    t.datetime "milking_datetime"
    t.integer "milked_by"
    t.integer "confirmed_by"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cow_id"], name: "index_milkings_on_cow_id"
    t.index ["milked_by", "confirmed_by", "user_id"], name: "index_milkings_on_milked_by_and_confirmed_by_and_user_id"
    t.index ["milking_time_id"], name: "index_milkings_on_milking_time_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "shades", force: :cascade do |t|
    t.bigint "dairy_id", null: false
    t.string "name", null: false
    t.text "desc"
    t.integer "capacity", null: false
    t.boolean "active", default: true
    t.integer "created_by", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by"], name: "index_shades_on_created_by"
    t.index ["dairy_id"], name: "index_shades_on_dairy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true
    t.string "phone_token"
    t.boolean "phone_confirmed", default: false
    t.datetime "phone_confirmed_at"
    t.string "email_token"
    t.boolean "email_confirmed", default: false
    t.datetime "emai_confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "reset_password_reset_at"
    t.integer "reset_password_count"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "unlocked_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["phone_token"], name: "index_users_on_phone_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "cow_dairies", "cows"
  add_foreign_key "cow_dairies", "dairies"
  add_foreign_key "cow_dairies", "users"
  add_foreign_key "cow_shades", "cows"
  add_foreign_key "cow_shades", "shades"
  add_foreign_key "cows", "dairies"
  add_foreign_key "invitations", "dairies"
  add_foreign_key "invitations", "users"
  add_foreign_key "milkings", "cows"
  add_foreign_key "milkings", "milking_times"
  add_foreign_key "shades", "dairies"
end
