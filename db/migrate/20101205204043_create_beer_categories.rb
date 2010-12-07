class CreateBeerCategories < ActiveRecord::Migration
  def self.up
		create_table :beer_categories, :force => true do |t|
		  t.string :name
		  t.timestamps
		end
  end

  def self.down
		drop_table :beer_categories
  end
end