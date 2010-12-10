class Press < ActiveRecord::Base

  acts_as_indexed :fields => [:headline, :author, :publication, :content]

  validates_presence_of :headline
  validates_uniqueness_of :headline
  
  named_scope :published, :conditions => { :published => true }
  named_scope :unpublished, :conditions => { :published => false }

  belongs_to :pdf, :class_name => 'Resource'

  
end
