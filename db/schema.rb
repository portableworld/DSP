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
	# All datetime fields titled "created_at" and "updated_at" are
	# auto-generated defaults in Rails. 


	# This connects Content to a User. 
	# This is populated when a User clicks on a Cell to add to their show.
  create_table "compilations", :force => true do |t|
	# If we switch to using the Username from Sitefinity
	# "user_id" will need to be changed to t.string
    t.integer  "user_id"
    t.integer  "content_id"
	t.integer  "link_id"
    t.date     "show_date"
    t.datetime "created_at"
    t.datetime "updated_at"
	# "order" is used to order the content in the Show panel (right-side)
    t.integer  "order"
  end

	# This is all the content (ie Genuis Award, Top o the News)
  create_table "contents", :force => true do |t|
    t.text     "body"
	# This "order" is how it appears in the Cell in which it is contained.
    t.integer  "order"
	# The "panel" is what Ron calls a "Cell"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

	# This was going to be what later became "Compilations"
	# (Delete this through Migration)
  create_table "contents_users", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "content_id", :null => false
    t.date    "show_date",  :null => false
  end

  add_index "contents_users", ["user_id", "content_id"], :name => "index_contents_users_on_user_id_and_content_id", :unique => true

  # This was to be the Link version of "Compilations"
  # It is now needless since is has been added to Compilations
  # (Delete this through Migration)
  create_table "linkalations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.date     "show_date"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # This holds all the Link information
  create_table "links", :force => true do |t|
    t.string   "href"
    t.integer  "order"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # This holds all the Cell information
  create_table "panels", :force => true do |t|
    t.string   "title"
    t.date     "date_made"
    t.string   "live_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # This holds what Show Date the User is presently working on. 
  # It is used to populate any other "show_date" fields in other tables
  create_table "showDate_link", :force => true do |t|
    t.date     "show_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # This was a stupid attempt to make a table just for holding 
  # Content's order. Added the "order" field to the Compilations table instead
  # (delete this through Migration)
  create_table "show_preps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.date     "show_date"
    t.integer  "content_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # No idea why I put this here. Late night, maybe. 
  # (delete through Migration)
  create_table "showdate_links", :id => false, :force => true do |t|
    t.date     "showdate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # Another late night, perhaps?
  # (delete through Migration)
  create_table "top_bars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # This table is autogenerated through an authentication plug-in
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

  # This later became Compilations
  # (delete through Migration)
  create_table "users_contents", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "content_id", :null => false
    t.date    "show_date",  :null => false
    t.integer "order"
  end

  add_index "users_contents", ["user_id", "content_id"], :name => "index_users_contents_on_user_id_and_content_id", :unique => true

  # This keeps track of which Cell a User has clicked on. 
  # If an entry in this table exists for the user_id and panel_id,
  # then no "unread" icon is shown. 
  # Else, an "unread" icon is shown for the Cell.
  create_table "visualizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
