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

ActiveRecord::Schema.define(version: 2020_10_08_122141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "url"
    t.text "content"
    t.text "image"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "task_id", null: false
    t.bigint "challenge_start_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", default: 0, null: false
    t.bigint "challenge_course_id", default: 0, null: false
    t.index ["assign_id"], name: "index_answers_on_assign_id"
    t.index ["challenge_course_id"], name: "index_answers_on_challenge_course_id"
    t.index ["challenge_start_id"], name: "index_answers_on_challenge_start_id"
    t.index ["course_id"], name: "index_answers_on_course_id"
    t.index ["task_id"], name: "index_answers_on_task_id"
    t.index ["team_id"], name: "index_answers_on_team_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "assigns", force: :cascade do |t|
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id", "user_id"], name: "index_assigns_on_team_id_and_user_id", unique: true
  end

  create_table "challenge_courses", force: :cascade do |t|
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "limited_release_enabled", default: false, null: false
    t.index ["assign_id"], name: "index_challenge_courses_on_assign_id"
    t.index ["course_id"], name: "index_challenge_courses_on_course_id"
    t.index ["team_id"], name: "index_challenge_courses_on_team_id"
    t.index ["user_id"], name: "index_challenge_courses_on_user_id"
  end

  create_table "challenge_starts", force: :cascade do |t|
    t.integer "status", null: false
    t.date "deadline"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", default: 0, null: false
    t.bigint "challenge_course_id", default: 0, null: false
    t.index ["assign_id"], name: "index_challenge_starts_on_assign_id"
    t.index ["challenge_course_id"], name: "index_challenge_starts_on_challenge_course_id"
    t.index ["course_id"], name: "index_challenge_starts_on_course_id"
    t.index ["task_id"], name: "index_challenge_starts_on_task_id"
    t.index ["team_id"], name: "index_challenge_starts_on_team_id"
    t.index ["user_id"], name: "index_challenge_starts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.text "image"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "task_id", null: false
    t.bigint "challenge_start_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", default: 0, null: false
    t.bigint "challenge_course_id", default: 0, null: false
    t.index ["answer_id"], name: "index_comments_on_answer_id"
    t.index ["assign_id"], name: "index_comments_on_assign_id"
    t.index ["challenge_course_id"], name: "index_comments_on_challenge_course_id"
    t.index ["challenge_start_id"], name: "index_comments_on_challenge_start_id"
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["task_id"], name: "index_comments_on_task_id"
    t.index ["team_id"], name: "index_comments_on_team_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "image", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["assign_id"], name: "index_courses_on_assign_id"
    t.index ["team_id"], name: "index_courses_on_team_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "feed_backs", force: :cascade do |t|
    t.integer "feeling_number", null: false
    t.text "reason"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "task_id", null: false
    t.bigint "challenge_start_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id", default: 0, null: false
    t.bigint "challenge_course_id", default: 0, null: false
    t.index ["answer_id"], name: "index_feed_backs_on_answer_id"
    t.index ["assign_id"], name: "index_feed_backs_on_assign_id"
    t.index ["challenge_course_id"], name: "index_feed_backs_on_challenge_course_id"
    t.index ["challenge_start_id"], name: "index_feed_backs_on_challenge_start_id"
    t.index ["course_id"], name: "index_feed_backs_on_course_id"
    t.index ["task_id"], name: "index_feed_backs_on_task_id"
    t.index ["team_id"], name: "index_feed_backs_on_team_id"
    t.index ["user_id"], name: "index_feed_backs_on_user_id"
  end

  create_table "question_comments", force: :cascade do |t|
    t.text "content", null: false
    t.text "image"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "challenge_start_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id", default: 0, null: false
    t.index ["assign_id"], name: "index_question_comments_on_assign_id"
    t.index ["challenge_start_id"], name: "index_question_comments_on_challenge_start_id"
    t.index ["question_id"], name: "index_question_comments_on_question_id"
    t.index ["team_id"], name: "index_question_comments_on_team_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "image"
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.bigint "assign_id", null: false
    t.bigint "challenge_course_id", null: false
    t.bigint "challenge_start_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", default: 0, null: false
    t.bigint "task_id", default: 0, null: false
    t.index ["assign_id"], name: "index_questions_on_assign_id"
    t.index ["challenge_course_id"], name: "index_questions_on_challenge_course_id"
    t.index ["challenge_start_id"], name: "index_questions_on_challenge_start_id"
    t.index ["task_id"], name: "index_questions_on_task_id"
    t.index ["team_id"], name: "index_questions_on_team_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "image", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "assign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority_no", default: 0, null: false
    t.bigint "course_id", default: 0, null: false
    t.bigint "challenge_course_id", default: 0, null: false
    t.index ["assign_id"], name: "index_tasks_on_assign_id"
    t.index ["challenge_course_id"], name: "index_tasks_on_challenge_course_id"
    t.index ["course_id"], name: "index_tasks_on_course_id"
    t.index ["team_id"], name: "index_tasks_on_team_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.text "image"
    t.text "remarks"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.text "profile"
    t.text "image"
    t.boolean "admin", default: false, null: false
    t.integer "status", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "assigns"
  add_foreign_key "answers", "challenge_courses"
  add_foreign_key "answers", "challenge_starts"
  add_foreign_key "answers", "courses"
  add_foreign_key "answers", "tasks"
  add_foreign_key "answers", "teams"
  add_foreign_key "answers", "users"
  add_foreign_key "assigns", "teams"
  add_foreign_key "assigns", "users"
  add_foreign_key "challenge_courses", "assigns"
  add_foreign_key "challenge_courses", "courses"
  add_foreign_key "challenge_courses", "teams"
  add_foreign_key "challenge_courses", "users"
  add_foreign_key "challenge_starts", "assigns"
  add_foreign_key "challenge_starts", "challenge_courses"
  add_foreign_key "challenge_starts", "courses"
  add_foreign_key "challenge_starts", "tasks"
  add_foreign_key "challenge_starts", "teams"
  add_foreign_key "challenge_starts", "users"
  add_foreign_key "comments", "answers"
  add_foreign_key "comments", "assigns"
  add_foreign_key "comments", "challenge_courses"
  add_foreign_key "comments", "challenge_starts"
  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "tasks"
  add_foreign_key "comments", "teams"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "assigns"
  add_foreign_key "courses", "teams"
  add_foreign_key "courses", "users"
  add_foreign_key "feed_backs", "answers"
  add_foreign_key "feed_backs", "assigns"
  add_foreign_key "feed_backs", "challenge_courses"
  add_foreign_key "feed_backs", "challenge_starts"
  add_foreign_key "feed_backs", "courses"
  add_foreign_key "feed_backs", "tasks"
  add_foreign_key "feed_backs", "teams"
  add_foreign_key "feed_backs", "users"
  add_foreign_key "question_comments", "assigns"
  add_foreign_key "question_comments", "challenge_starts"
  add_foreign_key "question_comments", "questions"
  add_foreign_key "question_comments", "teams"
  add_foreign_key "question_comments", "users"
  add_foreign_key "questions", "assigns"
  add_foreign_key "questions", "challenge_courses"
  add_foreign_key "questions", "challenge_starts"
  add_foreign_key "questions", "tasks"
  add_foreign_key "questions", "teams"
  add_foreign_key "questions", "users"
  add_foreign_key "tasks", "assigns"
  add_foreign_key "tasks", "challenge_courses"
  add_foreign_key "tasks", "courses"
  add_foreign_key "tasks", "teams"
  add_foreign_key "tasks", "users"
  add_foreign_key "teams", "users"
end
