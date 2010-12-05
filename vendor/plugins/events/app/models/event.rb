class Event < ActiveRecord::Base
  belongs_to :event_type

  acts_as_indexed :fields => [:name, :description, :location]

  validates_presence_of :name
  validates_uniqueness_of :name

  has_friendly_id :name, :use_slug => true
  
  named_scope :published, :conditions => { :published => true }
  named_scope :beer, :conditions => [ "event_type_id = ?", 1 ]
  named_scope :theatre, :conditions => [ "event_type_id = ?", 2 ]

end
