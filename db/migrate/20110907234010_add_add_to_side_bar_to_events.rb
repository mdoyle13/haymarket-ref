class AddAddToSideBarToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :add_to_sidebar, :boolean
  end

  def self.down
    remove_column :events, :add_to_sidebar, :boolean
  end
end