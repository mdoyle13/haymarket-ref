class MealTime < ActiveRecord::Base
  has_many :meal_time_foods
  has_many :foods, :through => :meal_time_foods
end