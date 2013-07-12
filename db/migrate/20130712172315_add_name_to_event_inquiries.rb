class AddNameToEventInquiries < ActiveRecord::Migration
  def self.up
    add_column :event_inquiries, :name, :string
  end

  def self.down
    remove_column :event_inquiries, :name
    
  end
end