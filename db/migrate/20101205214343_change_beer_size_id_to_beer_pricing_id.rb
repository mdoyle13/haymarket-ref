class ChangeBeerSizeIdToBeerPricingId < ActiveRecord::Migration
  def self.up
    rename_column :beers, :beer_size_id, :beer_pricing_id
  end

  def self.down
    rename_column :beers, :beer_pricing_id, :beer_size_id
  end
end