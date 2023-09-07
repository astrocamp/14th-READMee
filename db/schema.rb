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

ActiveRecord::Schema[7.0].define(version: 2023_09_07_075125) do
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

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.jsonb "use_skill"
    t.text "content"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_projects_on_profile_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "block"
    t.string "avatar"
    t.text "basic_info"
    t.text "social_links"
    t.text "work_experience"
    t.string "skills"
    t.integer "resume_state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "component_name"
    t.bigint "user_id"
    t.text "about_me"
    t.string "about_me_title"
    t.string "work_experience_title"
    t.string "languages"
    t.text "project"
    t.text "education"
    t.string "project_title"
    t.string "education_title"
    t.boolean "publish"
    t.string "full_name"
    t.string "phone"
    t.string "address"
    t.string "job_hunting"
    t.bigint "work_experience_id", null: false
    t.bigint "project_id", null: false
    t.bigint "education_id", null: false
    t.bigint "profile_id"
    t.index ["component_name"], name: "index_resumes_on_component_name", unique: true
    t.index ["education_id"], name: "index_resumes_on_education_id"
    t.index ["profile_id"], name: "index_resumes_on_profile_id"
    t.index ["project_id"], name: "index_resumes_on_project_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
    t.index ["work_experience_id"], name: "index_resumes_on_work_experience_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "projects", "profiles"
  add_foreign_key "resumes", "educations"
  add_foreign_key "resumes", "profiles"
  add_foreign_key "resumes", "projects"
  add_foreign_key "resumes", "users"
  add_foreign_key "resumes", "work_experiences"
  add_foreign_key "work_experiences", "profiles"
end
