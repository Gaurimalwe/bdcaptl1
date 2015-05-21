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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150417093712) do

  create_table "acess_rights", :force => true do |t|
    t.integer  "create_owner_id"
    t.string   "name"
    t.string   "can"
    t.string   "perform"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "acess_rights", ["create_owner_id"], :name => "index_acess_rights_on_create_owner_id"

  create_table "create_owners", :force => true do |t|
    t.string   "name"
    t.integer  "floor"
    t.string   "block"
    t.integer  "flat_number"
    t.string   "business_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "image"
    t.integer  "carpet_area"
    t.integer  "builtup_area"
    t.string   "mezzanine"
    t.string   "water_connection"
    t.string   "electricity"
    t.string   "ownership"
    t.string   "month_from"
    t.string   "month_to"
    t.integer  "per_month_rent"
    t.string   "auth_token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "file_uploads", :force => true do |t|
    t.integer  "create_owner_id"
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.string   "start_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "minute_taker"
    t.string   "attendee"
    t.string   "mob_nos"
    t.string   "about_meeting"
    t.string   "type_o"
    t.string   "owner"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "auth_token"
  end

end
