class Testimonial < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :city, :testimonial]

  validates_presence_of :name
  validates_uniqueness_of :name
  
  named_scope :published, :conditions => { :published => true }, :order => "position ASC"
  named_scope :unpublished, :conditions => { :published => false }


end
