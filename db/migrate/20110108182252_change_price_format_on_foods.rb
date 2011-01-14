class ChangePriceFormatOnFoods < ActiveRecord::Migration
  def self.up
    change_column :foods, :price, :string
  end

  def self.down
    change_column :foods, :price, :decimal
  end
end