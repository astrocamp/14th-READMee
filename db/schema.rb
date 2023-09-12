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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_111304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_articles_on_deleted_at"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.text "about"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "job_matchings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "interview_date"
    t.time "interview_time"
    t.text "interview_message"
    t.boolean "notified", default: false
    t.index ["company_id"], name: "index_job_matchings_on_company_id"
    t.index ["job_id"], name: "index_job_matchings_on_job_id"
    t.index ["user_id"], name: "index_job_matchings_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "num_of_people"
    t.string "seniority"
    t.string "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["deleted_at"], name: "index_jobs_on_deleted_at"
  end

  create_table "like_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.index ["article_id"], name: "index_like_logs_on_article_id"
    t.index ["user_id"], name: "index_like_logs_on_user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_portfolios_on_deleted_at"
  end

  create_table "profile_skills", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_skills_on_profile_id"
    t.index ["skill_id"], name: "index_profile_skills_on_skill_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "phone"
    t.string "address"
    t.text "about_me"
    t.jsonb "languages"
    t.jsonb "job_hunting"
    t.jsonb "social_link"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resume_skills", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resume_skills_on_resume_id"
    t.index ["skill_id"], name: "index_resume_skills_on_skill_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "block"
    t.text "social_links"
    t.integer "resume_state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "component_name"
    t.bigint "user_id"
    t.text "about_me"
    t.boolean "publish"
    t.string "full_name"
    t.string "phone"
    t.string "address"
    t.string "job_hunting"
    t.integer "area_1"
    t.integer "area_2"
    t.integer "area_3"
    t.integer "area_4"
    t.string "project_name_1"
    t.text "project_content_1"
    t.string "project_name_2"
    t.text "project_content_2"
    t.string "work_exp_name_1"
    t.text "work_exp_content_1"
    t.string "work_exp_start_date_1"
    t.string "work_exp_end_date_1"
    t.string "work_exp_name_2"
    t.text "work_exp_content_2"
    t.string "work_exp_start_date_2"
    t.string "work_exp_end_date_2"
    t.string "education_name_1"
    t.string "education_start_date_1"
    t.string "education_end_date_1"
    t.string "education_name_2"
    t.string "education_start_date_2"
    t.string "education_end_date_2"
    t.jsonb "languages"
    t.bigint "profile_id", null: false
    t.index ["component_name"], name: "index_resumes_on_component_name", unique: true
    t.index ["profile_id"], name: "index_resumes_on_profile_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_links", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_social_links_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "account"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_work_experiences_on_profile_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "educations", "profiles"
  add_foreign_key "job_matchings", "companies"
  add_foreign_key "job_matchings", "jobs"
  add_foreign_key "job_matchings", "users"
  add_foreign_key "like_logs", "articles"
  add_foreign_key "like_logs", "users"
  add_foreign_key "profile_skills", "profiles"
  add_foreign_key "profile_skills", "skills"
  add_foreign_key "profiles", "users"
  add_foreign_key "resume_skills", "resumes"
  add_foreign_key "resume_skills", "skills"
  add_foreign_key "resumes", "profiles"
  add_foreign_key "resumes", "users"
  add_foreign_key "social_links", "profiles"
  add_foreign_key "work_experiences", "profiles"
end
