class Food < ActiveRecord::Base
  belongs_to :food_category
  
  has_many :meal_time_foods
  has_many :meal_times, :through => :meal_time_foods

  acts_as_indexed :fields => [:name, :description]

  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :published, :conditions => { :published => true }, :order => "position ASC"
  named_scope :unpublished, :conditions => { :published => false }
  
  named_scope :appetizers, :conditions => { :food_category_id => 1 }
  named_scope :sides, :conditions => { :food_category_id => 5 }
  named_scope :housemade_sauces, :conditions => { :food_category_id => 12 }
  named_scope :kids, :conditions => { :food_category_id => 11 }
  named_scope :entrees, :conditions => { :food_category_id => 4 }
  named_scope :desserts, :conditions => { :food_category_id => 6 }
  named_scope :pizzas, :conditions => { :food_category_id => 8 }
  named_scope :sandwiches, :conditions => { :food_category_id => 7 }

  accepts_nested_attributes_for :meal_time_foods
  accepts_nested_attributes_for :meal_times
end
