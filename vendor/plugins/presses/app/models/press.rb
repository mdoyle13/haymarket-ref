class Press < ActiveRecord::Base

  acts_as_indexed :fields => [:headline, :author, :publication, :content]

  validates_presence_of :headline
  validates_uniqueness_of :headline

  belongs_to :pdf, :class_name => 'Resource'


end
