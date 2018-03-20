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

ActiveRecord::Schema.define(version: 20180316101201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "babies", force: :cascade do |t|
    t.integer "mother_id"
    t.integer "father_id"
    t.integer "user_id"
    t.integer "hospital_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "sex"
    t.string "date_of_birth"
    t.string "place_of_birth"
    t.string "health_center"
    t.string "physical_address"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "height"
    t.integer "weight"
    t.integer "age"
  end

  create_table "baby_cares", force: :cascade do |t|
    t.integer "baby_id"
    t.integer "care_label_id"
    t.string "description"
    t.string "comment"
    t.integer "care_month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baby_infant_feedings", force: :cascade do |t|
    t.integer "baby_id"
    t.integer "infant_feeding_label_answer_id"
    t.integer "infant_feeding_label_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baby_risk_factors", force: :cascade do |t|
    t.integer "baby_id"
    t.integer "risk_factor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baby_vaccinations", force: :cascade do |t|
    t.integer "baby_id"
    t.integer "vaccination_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_labels", force: :cascade do |t|
    t.string "title"
    t.string "input_type"
    t.integer "min_duration"
    t.integer "max_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_months", force: :cascade do |t|
    t.string "title"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cares", force: :cascade do |t|
    t.integer "baby_id"
    t.string "arv_supplied"
    t.string "ctx_supplied"
    t.string "initial_used"
    t.string "initial_done"
    t.string "initial_number"
    t.string "initial_result"
    t.string "initial_referred_art"
    t.string "initial_initiated_art"
    t.string "repeat_used"
    t.string "repeat_done"
    t.string "repeat_number"
    t.string "repeat_result"
    t.string "repeat_referred_art"
    t.string "repeat_initiated_art"
    t.string "breastfeeding_used"
    t.string "breastfeeding_done"
    t.string "breastfeeding_number"
    t.string "breastfeeding_result"
    t.string "breastfeeding_referred_art"
    t.string "breastfeeding_initiated_art"
    t.string "comments"
    t.boolean "mother_art"
    t.boolean "arv_prophylaxis_given_at_birth"
    t.string "arv_prophylaxis_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fathers", force: :cascade do |t|
    t.integer "national_id"
    t.string "email"
    t.string "date_of_birth"
    t.string "physical_address"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "id_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "baby_id"
    t.string "phone_number"
  end

  create_table "healths", force: :cascade do |t|
    t.integer "baby_id"
    t.integer "age"
    t.float "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.string "creator_type"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_type", "creator_id"], name: "index_hospitals_on_creator_type_and_creator_id"
  end

  create_table "infant_feeding_label_answers", force: :cascade do |t|
    t.integer "infant_feeding_label_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infant_feeding_labels", force: :cascade do |t|
    t.string "title"
    t.string "input_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infant_feeding_months", force: :cascade do |t|
    t.string "title"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infant_feedings", force: :cascade do |t|
    t.integer "baby_id"
    t.string "breast_milk"
    t.string "except_breast_milk"
    t.boolean "breastfeeding_hour_delivery"
    t.string "duration"
    t.string "complementary_foods"
    t.string "breastfeeding_continues"
    t.string "food_groups_given_day"
    t.string "no_of_meals_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mothers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "national_id"
    t.string "email"
    t.string "date_of_birth"
    t.string "physical_address"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "id_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "baby_id"
    t.string "phone_number"
  end

  create_table "risk_factors", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.integer "hospital_id"
    t.string "role", default: "admin"
    t.string "confirmation_token"
    t.time "confirmed_at"
    t.time "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccinations", force: :cascade do |t|
    t.integer "age"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vitamin_as", force: :cascade do |t|
    t.integer "baby_id"
    t.string "month_duration"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
