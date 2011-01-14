class Award < ActiveRecord::Base
  
  belongs_to :beer
  
  acts_as_indexed :fields => [:event_name, :category, :beer_name, :description]

  validates_presence_of :event_name
  validates_uniqueness_of :event_name

  named_scope :published, :conditions => { :published => true }, :order => "year DESC"
  named_scope :unpublished, :conditions => { :published => false }
  
end
