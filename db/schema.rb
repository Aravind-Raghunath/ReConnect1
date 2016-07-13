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

ActiveRecord::Schema.define(version: 20160713153330) do

  create_table "academic_degrees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "year_of_graduation"
    t.string   "college_or_university"
    t.integer  "alumnus_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["alumnus_id"], name: "index_academic_degrees_on_alumnus_id", using: :btree
  end

  create_table "alumni", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "usn"
    t.string   "year_of_graduation"
    t.string   "branch"
    t.string   "phone_number"
    t.string   "otp_secret_key"
    t.datetime "phone_number_verified_at"
    t.string   "verified_phone_number"
    t.date     "date_of_marriage"
    t.string   "location"
    t.index ["email"], name: "index_alumni_on_email", unique: true, using: :btree
    t.index ["phone_number"], name: "index_alumni_on_phone_number", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_alumni_on_reset_password_token", unique: true, using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "body",               limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "professional_experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "company_name"
    t.string   "designation"
    t.integer  "alumnus_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["alumnus_id"], name: "index_professional_experiences_on_alumnus_id", using: :btree
  end

  add_foreign_key "academic_degrees", "alumni"
  add_foreign_key "professional_experiences", "alumni"
end
