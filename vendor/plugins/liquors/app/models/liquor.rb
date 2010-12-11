class Liquor < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :liquor_category
  validates_presence_of :liquor_category


end
