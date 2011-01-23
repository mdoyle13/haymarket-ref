class AddShowDateTappedToBeers < ActiveRecord::Migration
  def self.up
    add_column :beers, :show_date_tapped, :boolean
  end

  def self.down
    remove_column :beers, :show_date_tapped
  end
end