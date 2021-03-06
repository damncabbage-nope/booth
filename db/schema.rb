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

ActiveRecord::Schema.define(:version => 20130425161401) do

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "customers", ["email"], :name => "index_customers_on_email"

  create_table "details", :force => true do |t|
    t.string   "full_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name",            :null => false
    t.text     "tagline"
    t.text     "description"
    t.datetime "sales_opened_at", :null => false
    t.datetime "sales_closed_at", :null => false
    t.datetime "began_at",        :null => false
    t.datetime "finished_at",     :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id",                                 :null => false
    t.integer  "product_id",                               :null => false
    t.integer  "details_id",                               :null => false
    t.decimal  "price",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "line_items", ["details_id"], :name => "index_line_items_on_details_id"
  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "email",                          :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "state",       :default => "new", :null => false
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "products", :force => true do |t|
    t.integer  "event_id"
    t.string   "name",                                     :null => false
    t.decimal  "price",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "products", ["event_id"], :name => "index_products_on_event_id"

end
