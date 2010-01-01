# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091121215042) do

  create_table "compilations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.date     "show_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "contents", :force => true do |t|
    t.text     "body"
    t.integer  "order"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents_users", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "content_id", :null => false
    t.date    "show_date",  :null => false
  end

  add_index "contents_users", ["user_id", "content_id"], :name => "index_contents_users_on_user_id_and_content_id", :unique => true

  create_table "linkalations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.date     "show_date"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "href"
    t.integer  "order"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "panels", :force => true do |t|
    t.string   "title"
    t.date     "date_made"
    t.string   "live_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showDate_link", :force => true do |t|
    t.date     "show_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_preps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.date     "show_date"
    t.integer  "content_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showdate_links", :id => false, :force => true do |t|
    t.date     "showdate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "top_bars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "writer",                                  :default => false, :null => false
    t.boolean  "admin",                                   :default => false, :null => false
  end

  create_table "users_contents", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "content_id", :null => false
    t.date    "show_date",  :null => false
    t.integer "order"
  end

  add_index "users_contents", ["user_id", "content_id"], :name => "index_users_contents_on_user_id_and_content_id", :unique => true

  create_table "visualizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
