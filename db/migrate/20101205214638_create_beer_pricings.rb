class CreateBeerPricings < ActiveRecord::Migration
  def self.up
    create_table :beer_pricings, :force => true do |t|
      t.integer :beer_id
      t.integer :beer_size_id
      t.decimal :price, :precision => 10, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :beer_pricings
  end
end