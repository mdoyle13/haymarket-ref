class RemovePriceFromBeers < ActiveRecord::Migration
  def self.up
    remove_column :beers, :price
  end

  def self.down
    add_column :beers, :price, :decimal
  end
end
