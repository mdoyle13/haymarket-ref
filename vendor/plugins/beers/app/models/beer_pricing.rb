class BeerPricing < ActiveRecord::Base
  validates_presence_of :beer
  validates_presence_of :beer_size
  validates_presence_of :price
  
  belongs_to :beer
  belongs_to :beer_size
  
  def size_name
    self.beer_size.name
  end
end