class CreateBeerSizes < ActiveRecord::Migration
  def self.up
		create_table :beer_sizes, :force => true do |t|
		  t.string :name
		  t.timestamps
		end
		
		add_column :beers, :beer_size_id, :integer
  end

  def self.down
		remove_column :beers, :beer_size_id
		drop_table :beer_sizes
  end
end