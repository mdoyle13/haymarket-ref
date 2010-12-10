class AddPublishedtoAccolades < ActiveRecord::Migration
  def self.up
    add_column :awards, :published, :boolean
    add_column :presses, :published, :boolean
    add_column :testimonials, :published, :boolean
    
  end

  def self.down
    remove_column :awards, :published
    remove_column :presses, :published 
    remove_column :testimonials, :published 
  end
  
end
