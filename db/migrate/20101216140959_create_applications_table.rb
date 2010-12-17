class CreateApplicationsTable < ActiveRecord::Migration
  def self.up
    create_table "applications", :force => true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "position"
      t.text     "message"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :applications
  end
end