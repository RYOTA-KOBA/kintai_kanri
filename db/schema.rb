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

ActiveRecord::Schema.define(version: 2021_12_31_034146) do

  create_table "attendances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "employee_id"
    t.string "working_time", default: "", null: false, comment: "1日の働いた時間合計"
    t.string "rest_time", null: false, comment: "休憩時間の合計"
    t.integer "rest_id", null: false, comment: "休憩時間ID"
    t.integer "clock_in_id", null: false
    t.integer "clock_out_id", null: false
    t.integer "rest_in_id"
    t.integer "rest_out_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clock_ins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "employee_id", null: false, comment: "従業員特定用id"
    t.datetime "clock_in_time", null: false, comment: "勤務開始時刻"
    t.string "clock_in_date", null: false, comment: "勤務開始時刻の日付"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clock_outs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "employee_id", null: false, comment: "従業員特定用id"
    t.datetime "clock_out_time", null: false, comment: "勤務終了時刻"
    t.string "clock_out_date", null: false, comment: "勤務終了時刻の日付"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false, comment: "従業員名"
    t.integer "store_id", comment: "所属する店舗ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  create_table "rest_ins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "employee_id", null: false, comment: "従業員特定用id"
    t.datetime "rest_in_time", null: false, comment: "休憩開始時刻"
    t.string "rest_in_date", null: false, comment: "休憩開時刻の日付"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rest_outs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "employee_id", null: false, comment: "従業員特定用id"
    t.datetime "rest_out_time", null: false, comment: "休憩終了時刻"
    t.string "rest_out_date", null: false, comment: "休憩終了時刻の日付"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "rest_start", null: false, comment: "休憩開始"
    t.datetime "rest_end", null: false, comment: "休憩終了"
    t.integer "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "店舗", force: :cascade do |t|
    t.string "name", null: false, comment: "店舗名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
