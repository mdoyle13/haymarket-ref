class AddLegendFlagsToFoods < ActiveRecord::Migration
  def self.up
    add_column :foods, :housemade, :boolean
    add_column :foods, :vegan, :boolean
    add_column :foods, :spicy, :boolean
  end

  def self.down
    remove_column :foods, :spicy
    remove_column :foods, :vegan
    remove_column :foods, :housemade
  end
end