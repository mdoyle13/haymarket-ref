class AddFrontAndBackBarOptionsToBeers < ActiveRecord::Migration
  def self.up
    add_column :beers, :front_bar, :boolean
    add_column :beers, :back_bar, :boolean
  end

  def self.down
    remove_column :beers, :front_bar
    remove_column :beers, :back_bar
  end
end