class RemoveAwardsFromBeer < ActiveRecord::Migration
  def self.up
    remove_column :beers, :awards 
  end

  def self.down
    add_column :beers, :awards, :text
  end
end
