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

ActiveRecord::Schema.define(:version => 20130712172315) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "awards", :force => true do |t|
    t.string   "event_name"
    t.string   "category"
    t.string   "beer_name"
    t.string   "description"
    t.datetime "year"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.integer  "beer_id"
  end

  add_index "awards", ["id"], :name => "index_awards_on_id"

  create_table "beer_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beer_pricings", :force => true do |t|
    t.integer  "beer_id"
    t.integer  "beer_size_id"
    t.decimal  "price",        :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beer_sizes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_tapped"
    t.string   "brewery"
    t.boolean  "featured"
    t.boolean  "published",                                                     :default => false, :null => false
    t.integer  "beer_category_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beer_pricing_id"
    t.decimal  "og",                             :precision => 11, :scale => 3
    t.decimal  "fg",                             :precision => 11, :scale => 3
    t.integer  "ibu",              :limit => 10, :precision => 10, :scale => 0
    t.decimal  "abv",                            :precision => 11, :scale => 1
    t.decimal  "draft_price_4oz",                :precision => 11, :scale => 2
    t.decimal  "draft_price_12oz",               :precision => 11, :scale => 2
    t.decimal  "draft_price_16oz",               :precision => 11, :scale => 2
    t.decimal  "draft_price_20oz",               :precision => 11, :scale => 2
    t.decimal  "bottle_oz",                      :precision => 11, :scale => 1
    t.decimal  "bottle_price",                   :precision => 11, :scale => 2
    t.boolean  "show_date_tapped"
    t.boolean  "on_draft",                                                      :default => false
    t.boolean  "on_bottle",                                                     :default => false
    t.boolean  "front_bar"
    t.boolean  "back_bar"
  end

  add_index "beers", ["id"], :name => "index_beers_on_id"

  create_table "blog_settings", :force => true do |t|
    t.string   "name"
    t.boolean  "value"
    t.string   "entry"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "excerpt"
    t.text     "body"
    t.boolean  "draft",           :default => false
    t.boolean  "allow_comment",   :default => true
    t.datetime "publishing_date"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["id"], :name => "index_blogs_on_id"
  add_index "blogs", ["permalink"], :name => "index_blogs_on_permalink"

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "approved"
    t.string   "name"
    t.string   "email"
    t.string   "token"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["blog_id"], :name => "index_comments_on_blog_id"

  create_table "event_inquiries", :force => true do |t|
    t.string   "date"
    t.string   "time"
    t.string   "num_people"
    t.string   "occasion"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.text     "extra_requirements"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "event_inquiries", ["id"], :name => "index_event_inquiries_on_id"

  create_table "event_types", :force => true do |t|
    t.string "name"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.datetime "end_date"
    t.string   "location"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type_id"
    t.boolean  "featured"
    t.string   "price"
    t.string   "purchase_link"
    t.string   "editor"
    t.boolean  "published"
    t.string   "venue"
    t.boolean  "add_to_sidebar"
  end

  add_index "events", ["id"], :name => "index_events_on_id"

  create_table "food_categories", :force => true do |t|
    t.string "name"
  end

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "food_category_id"
    t.boolean  "daily_special"
    t.string   "price"
    t.boolean  "published"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "housemade"
    t.boolean  "vegan"
    t.boolean  "spicy"
  end

  add_index "foods", ["id"], :name => "index_foods_on_id"

  create_table "homeslides", :force => true do |t|
    t.string   "caption"
    t.integer  "photo_id"
    t.string   "video_embed"
    t.integer  "order"
    t.boolean  "is_video"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  add_index "homeslides", ["id"], :name => "index_homeslides_on_id"

  create_table "images", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "image_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["parent_id"], :name => "index_images_on_parent_id"

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.integer  "position"
    t.boolean  "open",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "spam",       :default => false
    t.string   "send_to"
  end

  create_table "inquiry_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liquor_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liquors", :force => true do |t|
    t.string   "name"
    t.boolean  "published"
    t.integer  "price",              :limit => 10, :precision => 10, :scale => 0
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "liquor_category_id"
  end

  add_index "liquors", ["id"], :name => "index_liquors_on_id"

  create_table "meal_time_foods", :id => false, :force => true do |t|
    t.integer "meal_time_id", :null => false
    t.integer "food_id",      :null => false
  end

  create_table "meal_times", :force => true do |t|
    t.string "name"
  end

  create_table "page_parts", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_parts", ["id"], :name => "index_page_parts_on_id"
  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"

  create_table "page_translations", :force => true do |t|
    t.integer "page_id"
    t.string  "custom_title"
    t.string  "meta_keywords"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.string   "custom_title"
    t.string   "custom_title_type",   :default => "none"
    t.boolean  "draft",               :default => false
    t.string   "browser_title"
    t.boolean  "skip_to_first_child", :default => false
  end

  add_index "pages", ["id"], :name => "index_pages_on_id"
  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"

  create_table "presses", :force => true do |t|
    t.string   "headline"
    t.string   "author"
    t.string   "publication"
    t.text     "content"
    t.integer  "pdf_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  add_index "presses", ["id"], :name => "index_presses_on_id"

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "resources", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "sidebars", :force => true do |t|
    t.string   "title"
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "sidebars", ["id"], :name => "index_sidebars_on_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_name_and_sluggable_type_and_scope_and_sequence", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.text     "testimonial"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  add_index "testimonials", ["id"], :name => "index_testimonials_on_id"

  create_table "user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "user_plugins", ["name"], :name => "index_user_plugins_on_name"
  add_index "user_plugins", ["user_id", "name"], :name => "index_unique_user_plugins", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token"
  end

  add_index "users", ["id"], :name => "index_users_on_id"

  create_table "wine_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wines", :force => true do |t|
    t.string   "name"
    t.boolean  "published"
    t.integer  "glass_price",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "bottle_price",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wine_category_id"
  end

  add_index "wines", ["id"], :name => "index_wines_on_id"

end
