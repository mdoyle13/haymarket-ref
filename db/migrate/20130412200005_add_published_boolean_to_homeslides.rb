class AddPublishedBooleanToHomeslides < ActiveRecord::Migration
  def self.up
    add_column :homeslides, :published, :boolean
  end

  def self.down
    remove_column :homeslides, :published, :boolean
  end
end
