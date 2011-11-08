class AddUrlFieldToSidebarsPlugin < ActiveRecord::Migration
  def self.up
    add_column :sidebars, :url, :string
  end

  def self.down
    remove_column :sidebars, :url
  end
end