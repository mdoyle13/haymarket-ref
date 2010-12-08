class AddBeerNerdDataToBeers < ActiveRecord::Migration
  def self.up
    add_column :beers, :og, :decimal
    add_column :beers, :fg, :decimal
    add_column :beers, :ibv, :decimal
    add_column :beers, :abv, :decimal
  end

  def self.down
    remove_column :beers, :abv
    remove_column :beers, :ibv
    remove_column :beers, :fg
    remove_column :beers, :og
  end
end