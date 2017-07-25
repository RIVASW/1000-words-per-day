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

ActiveRecord::Schema.define(version: 20170719150329) do

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "translations", force: true do |t|
    t.integer  "foreign_word_id"
    t.integer  "translation_word_id"
    t.integer  "translations_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translations", ["foreign_word_id"], name: "index_translations_on_foreign_word_id", using: :btree
  add_index "translations", ["translation_word_id"], name: "index_translations_on_translation_word_id", using: :btree
  add_index "translations", ["translations_list_id"], name: "index_translations_on_translations_list_id", using: :btree

  create_table "translations_lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "word_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["language_id"], name: "index_words_on_language_id", using: :btree

end
