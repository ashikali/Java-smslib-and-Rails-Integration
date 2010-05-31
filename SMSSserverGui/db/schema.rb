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

ActiveRecord::Schema.define(:version => 0) do

  create_table "outgoing_sms_content_groups", :force => true do |t|
    t.string    "group_name",  :null => false
    t.text      "sms_content", :null => false
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "outgoing_sms_number_groups", :force => true do |t|
    t.string    "group_name",    :null => false
    t.text      "phone_numbers", :null => false
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
  end

  create_table "smsserver_calls", :force => true do |t|
    t.datetime "call_date",                                   :null => false
    t.string   "gateway_id", :limit => 64,                    :null => false
    t.text     "caller_id",                                   :null => false
    t.boolean  "isread",                   :default => false
  end

  create_table "smsserver_in_messages", :force => true do |t|
    t.integer  "process",                               :null => false
    t.string   "originator",            :limit => 16,   :null => false
    t.string   "message_type",          :limit => 1,    :null => false
    t.string   "encoding",              :limit => 1,    :null => false
    t.datetime "message_date",                          :null => false
    t.datetime "receive_date",                          :null => false
    t.string   "text",                  :limit => 1000, :null => false
    t.string   "original_ref_no",       :limit => 64
    t.datetime "original_receive_date"
    t.string   "gateway_id",            :limit => 64
  end

  create_table "smsserver_out_messages", :force => true do |t|
    t.string    "message_type",    :limit => 1,    :default => "O", :null => false
    t.string    "recipient",       :limit => 16,                    :null => false
    t.string    "text",            :limit => 1000,                  :null => false
    t.string    "wap_url",         :limit => 100
    t.datetime  "wap_expiry_date"
    t.string    "wap_signal",      :limit => 1
    t.timestamp "create_date",                                      :null => false
    t.string    "originator",      :limit => 16,   :default => " ", :null => false
    t.string    "encoding",        :limit => 1,    :default => "7", :null => false
    t.integer   "status_report",                   :default => 0,   :null => false
    t.integer   "flash_sms",                       :default => 0,   :null => false
    t.integer   "src_port",                        :default => -1,  :null => false
    t.integer   "dst_port",                        :default => -1,  :null => false
    t.datetime  "sent_date"
    t.string    "ref_no",          :limit => 64
    t.integer   "priority",                        :default => 0,   :null => false
    t.string    "status",          :limit => 1,    :default => "U", :null => false
    t.integer   "no_of_errors",                    :default => 0,   :null => false
    t.string    "gateway_id",      :limit => 64,   :default => "*", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "password",   :null => false
    t.string    "user_name",  :null => false
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end
   
  User.create( :user_name => 'smslib',:password => 'smslib' );

end
