class Award < ActiveRecord::Base

  acts_as_indexed :fields => [:event_name, :category, :beer_name, :award]

  validates_presence_of :event_name
  validates_uniqueness_of :event_name

  named_scope :published, :conditions => { :published => true }, :order => "position ASC"
  named_scope :unpublished, :conditions => { :published => false }
  
end
