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

ActiveRecord::Schema.define(version: 20180829161749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "pg_trgm"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "votation_id"
    t.bigint "voter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votation_id"], name: "index_comments_on_votation_id"
    t.index ["voter_id"], name: "index_comments_on_voter_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "identity_docs", force: :cascade do |t|
    t.string "run"
    t.integer "doc_type"
    t.string "doc_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderations", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "votation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_moderations_on_admin_id"
    t.index ["votation_id"], name: "index_moderations_on_votation_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_alerts", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_sub_alerts_on_notification_id"
    t.index ["subscription_id"], name: "index_sub_alerts_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "voter_id"
    t.bigint "votation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votation_id"], name: "index_subscriptions_on_votation_id"
    t.index ["voter_id"], name: "index_subscriptions_on_voter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "FirstName"
    t.string "MiddleName"
    t.string "LastName"
    t.string "SecondLastName"
    t.date "BirthDate"
    t.string "imgpath"
    t.bigint "identity_doc_id"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identity_doc_id"], name: "index_users_on_identity_doc_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votation_options", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "votation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votation_id"], name: "index_votation_options_on_votation_id"
  end

  create_table "votation_results", force: :cascade do |t|
    t.bigint "votation_id"
    t.string "final_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votation_id"], name: "index_votation_results_on_votation_id"
  end

  create_table "votation_rt_results", force: :cascade do |t|
    t.bigint "votation_id"
    t.string "temporal_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votation_id"], name: "index_votation_rt_results_on_votation_id"
  end

  create_table "votations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.boolean "displayed", default: true
    t.string "state"
    t.string "imgpath"
    t.index ["owner_id"], name: "index_votations_on_owner_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id"
    t.bigint "votation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "votation_option_id"
    t.index ["votation_id"], name: "index_votes_on_votation_id"
    t.index ["votation_option_id"], name: "index_votes_on_votation_option_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "comments", "users", column: "voter_id"
  add_foreign_key "comments", "votations"
  add_foreign_key "identities", "users"
  add_foreign_key "moderations", "users", column: "admin_id"
  add_foreign_key "moderations", "votations"
  add_foreign_key "sub_alerts", "notifications"
  add_foreign_key "sub_alerts", "subscriptions"
  add_foreign_key "subscriptions", "users", column: "voter_id"
  add_foreign_key "subscriptions", "votations"
  add_foreign_key "users", "identity_docs"
  add_foreign_key "votation_options", "votations"
  add_foreign_key "votation_results", "votations"
  add_foreign_key "votation_rt_results", "votations"
  add_foreign_key "votations", "users", column: "owner_id"
  add_foreign_key "votes", "users", column: "voter_id"
  add_foreign_key "votes", "votation_options"
  add_foreign_key "votes", "votations"
end
