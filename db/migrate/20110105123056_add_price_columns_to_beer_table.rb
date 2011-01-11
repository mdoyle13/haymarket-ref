class AddPriceColumnsToBeerTable < ActiveRecord::Migration
  def self.up
    add_column :beers, :draft_price_4oz, :decimal, :precision => 11, :scale => 2
    add_column :beers, :draft_price_12oz, :decimal, :precision => 11, :scale => 2
    add_column :beers, :draft_price_16oz, :decimal, :precision => 11, :scale => 2
    add_column :beers, :draft_price_20oz, :decimal, :precision => 11, :scale => 2
    add_column :beers, :bottle_oz, :decimal, :precision => 11, :scale => 1
    add_column :beers, :bottle_price, :decimal, :precision => 11, :scale => 2
    change_column :beers, :og, :decimal, :precision => 11, :scale => 3
    change_column :beers, :fg, :decimal, :precision => 11, :scale => 3
    change_column :beers, :abv, :decimal, :precision => 11, :scale => 1
  end

  def self.down
    remove_column :beers, :draft_price_4oz
    remove_column :beers, :draft_price_12oz
    remove_column :beers, :draft_price_16oz
    remove_column :beers, :draft_price_20oz
    change_column :beers, :og, :decimal
    change_column :beers, :fg, :decimal
    change_column :beers, :abv, :decimal
  end
end
