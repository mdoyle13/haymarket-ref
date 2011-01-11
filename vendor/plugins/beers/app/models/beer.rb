class Beer < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description, :awards, :brewery]

  validates_presence_of :name
  validates_uniqueness_of :name
	validates_presence_of :beer_category_id

  has_many :beer_pricings
  has_many :beer_sizes, :through => :beer_pricings
  has_many :awards
  
  accepts_nested_attributes_for :beer_pricings, :allow_destroy => true, :reject_if => lambda { |record| record[:price].empty? }
  
  default_scope :order => :position
  named_scope :live, :conditions => {:published => true}
  
  def draft_price_4oz
  end
  def draft_price_12oz
  end
  def draft_price_16oz
  end
  def draft_price_20oz
  end

end
