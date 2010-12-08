class Testimonial < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :city, :testimonial]

  validates_presence_of :name
  validates_uniqueness_of :name



end
