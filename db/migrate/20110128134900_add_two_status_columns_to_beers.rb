class AddTwoStatusColumnsToBeers < ActiveRecord::Migration
  def self.up
  	add_column :beers, :on_draft, :boolean, :default => false
  	add_column :beers, :on_bottle, :boolean, :default => false
  end

  def self.down
  	remove_column :beers, :on_draft
  	remove_column :beers, :on_bottle
  end
end
