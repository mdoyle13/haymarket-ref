class AddSendToToInquiries < ActiveRecord::Migration
  def self.up
		add_column :inquiries, :send_to, :string
  end

  def self.down
		remove_column :inquiries, :send_to
  end
end