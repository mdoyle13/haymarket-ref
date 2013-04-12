class Homeslide < ActiveRecord::Base

  acts_as_indexed :fields => [:caption, :video_embed]

  validates_presence_of :caption
  validates_uniqueness_of :caption

  belongs_to :photo, :class_name => 'Image'
  named_scope :published, :conditions => {:published => true}

end
