class Food < ActiveRecord::Base
  belongs_to :food_categories
  
  has_many :meal_time_foods
  has_many :meal_times, :through => :meal_time_foods

  acts_as_indexed :fields => [:name, :description]

  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :published, :conditions => { :published => true }, :order => "position ASC"
  named_scope :unpublished, :conditions => { :published => false }

  def meal_time_attributes=(meal_time_attributes)
    meal_time_attributes.each do |attributes|
      meal_time.build(attributes)
    end
  end
end
