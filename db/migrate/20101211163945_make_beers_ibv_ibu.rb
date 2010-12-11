class MakeBeersIbvIbu < ActiveRecord::Migration
  def self.up
    rename_column :beers, :ibv, :ibu
  end

  def self.down
    rename_column :beers, :ibu, :ibv
  end
end