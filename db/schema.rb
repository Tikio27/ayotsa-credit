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

ActiveRecord::Schema.define(version: 2018_06_05_101627) do

  create_table "amortizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "credit_id"
    t.integer "payment_number"
    t.decimal "capital", precision: 8, scale: 2
    t.decimal "interest", precision: 8, scale: 2
    t.decimal "insurance", precision: 8, scale: 2
    t.decimal "total", precision: 8, scale: 2
    t.decimal "remainder", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_amortizations_on_client_id"
    t.index ["credit_id"], name: "index_amortizations_on_credit_id"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "account_number"
    t.integer "age"
    t.date "date_of_birth"
    t.string "rfc"
    t.string "employer"
    t.integer "work_seniority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_by_credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "credit_id"
    t.bigint "client_id"
    t.bigint "user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_comments_by_credits_on_client_id"
    t.index ["credit_id"], name: "index_comments_by_credits_on_credit_id"
    t.index ["user_id"], name: "index_comments_by_credits_on_user_id"
  end

  create_table "concepts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "concept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts_by_credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "credit_id"
    t.bigint "client_id"
    t.bigint "concept_id"
    t.integer "latest_receipt"
    t.integer "previous_receipt"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_concepts_by_credits_on_client_id"
    t.index ["concept_id"], name: "index_concepts_by_credits_on_concept_id"
    t.index ["credit_id"], name: "index_concepts_by_credits_on_credit_id"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "client_id"
    t.decimal "credit_requested", precision: 10, scale: 2
    t.string "frequency"
    t.integer "term"
    t.decimal "monthly_interest_rate", precision: 8, scale: 2
    t.string "status"
    t.decimal "annual_interest_rate", precision: 8, scale: 2
    t.integer "payments_number"
    t.decimal "insurance", precision: 8, scale: 2
    t.decimal "payment_without_insurance", precision: 8, scale: 2
    t.decimal "total_payment", precision: 8, scale: 2
    t.decimal "interest_rate_to_payment", precision: 8, scale: 2
    t.text "analyst_comment"
    t.text "additional_comment"
    t.integer "analyst_id"
    t.text "observations_and_conditions"
    t.date "approved_at"
    t.date "completed_at"
    t.date "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_credits_on_client_id"
  end

  create_table "differences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "client_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_differences_on_client_id"
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "credit_id"
    t.boolean "payment_note"
    t.boolean "ife"
    t.boolean "proof_of_address"
    t.boolean "curp_doc"
    t.boolean "work_certificate"
    t.boolean "id_copy"
    t.boolean "credit_application_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_documents_on_client_id"
    t.index ["credit_id"], name: "index_documents_on_credit_id"
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amortizations", "clients"
  add_foreign_key "amortizations", "credits"
  add_foreign_key "comments_by_credits", "clients"
  add_foreign_key "comments_by_credits", "credits"
  add_foreign_key "comments_by_credits", "users"
  add_foreign_key "concepts_by_credits", "clients"
  add_foreign_key "concepts_by_credits", "concepts"
  add_foreign_key "concepts_by_credits", "credits"
  add_foreign_key "credits", "clients"
  add_foreign_key "differences", "clients"
  add_foreign_key "documents", "clients"
  add_foreign_key "documents", "credits"
end
