class Food < ActiveRecord::Base
  belongs_to :food_categories
  
  has_many :meal_time_foods
  has_many :meal_times, :through => :meal_time_foods

  acts_as_indexed :fields => [:name, :description]

  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :published, :conditions => { :published => true }, :order => "position ASC"
  named_scope :unpublished, :conditions => { :published => false }

  accepts_nested_attributes_for :meal_time_foods
  accepts_nested_attributes_for :meal_times
end
