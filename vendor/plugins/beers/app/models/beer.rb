class Beer < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description, :awards, :brewery]

  validates_presence_of :name
  validates_uniqueness_of :name
	validates_presence_of :description
	validates_presence_of :price
	validates_presence_of :beer_category_id
	validates_presence_of :beer_size_id

  has_many :beer_pricings
  has_many :beer_sizes, :through => :beer_pricings
  
  accepts_nested_attributes_for :beer_pricings, :allow_destroy => true

end
