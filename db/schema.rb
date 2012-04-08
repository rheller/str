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

ActiveRecord::Schema.define(:version => 20120321010546) do

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "part1"
    t.text     "part2"
    t.text     "embedded"
    t.text     "links"
    t.text     "extra"
    t.integer  "next_page"
    t.integer  "prev_page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "next_slug"
    t.string   "prev_slug"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taggings", :force => true do |t|
    t.integer   "tag_id"
    t.integer   "taggable_id"
    t.integer   "tagger_id"
    t.string    "tagger_type"
    t.string    "taggable_type"
    t.string    "context"
    t.timestamp "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "things", :force => true do |t|
    t.integer   "user_id"
    t.string    "title"
    t.text      "description"
    t.float     "price"
    t.string    "brand"
    t.string    "model"
    t.date      "acquired"
    t.date      "remind_on"
    t.boolean   "remind_random"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "category",       :limit => 40
    t.string    "purchased_from", :limit => 40
    t.string    "loaned_to",      :limit => 40
  end

  add_index "things", ["user_id"], :name => "index_things_on_user_id"

  create_table "users", :force => true do |t|
    t.string    "login",                     :limit => 40
    t.string    "name",                      :limit => 100
    t.string    "email",                     :limit => 100
    t.string    "crypted_password",          :limit => 40
    t.string    "salt",                      :limit => 40
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "remember_token",            :limit => 40
    t.timestamp "remember_token_expires_at"
    t.string    "activation_code",           :limit => 40
    t.timestamp "activated_at"
    t.string    "reset_code",                :limit => 40
    t.string    "firstname",                 :limit => 100
    t.string    "lastname",                  :limit => 100
    t.boolean   "admin",                                    :default => false
    t.integer   "reminder_interval",                        :default => 1
    t.date      "last_reminder"
    t.boolean   "iced",                                     :default => false
    t.boolean   "suspend_email",                            :default => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
