# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140120001144) do

  create_table "records", force: true do |t|
    t.string   "target_name"
    t.string   "target_category"
    t.integer  "target_count"
    t.string   "source_name"
    t.string   "source_category"
    t.string   "tag"
    t.date     "tagged_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "target_created_at"
    t.date     "source_created_at"
    t.integer  "source_count"
    t.string   "notes"
  end

  create_table "target_transactions", force: true do |t|
    t.string   "name"
    t.date     "entered_at"
    t.integer  "clearing"
    t.date     "allocated_at"
    t.date     "processed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
