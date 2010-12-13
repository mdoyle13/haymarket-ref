class AddBeerIdToAwardsTable < ActiveRecord::Migration
  def self.up
    add_column :awards, :beer_id, :integer
  end

  def self.down
    remove_column :awadrds, :beer_id, :integer
  end
end
