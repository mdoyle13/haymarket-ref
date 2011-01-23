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
  named_scope :pending, :conditions => {:published => false}
  named_scope :bottles, :conditions => ["bottle_price IS NOT NULL"]
  named_scope :drafts, :conditions => ["draft_price_4oz IS NOT NULL OR draft_price_12oz IS NOT NULL OR draft_price_16oz IS NOT NULL or draft_price_20oz IS NOT NULL"]
  named_scope :haymarket, :conditions => {:brewery => 'Haymarket'}
  named_scope :not_haymarket, :conditions => ["brewery != Haymarket"]
  named_scope :by_name, :order => :name
  named_scope :unpriced, :conditions => {:bottle_price => nil, :draft_price_4oz => nil, :draft_price_12oz => nil, :draft_price_16oz => nil, :draft_price_20oz => nil}

end
