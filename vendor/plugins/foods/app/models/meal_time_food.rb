class MealTimeFood < ActiveRecord::Base
  belongs_to :meal_time
  belongs_to :food
  
  validates_presence_of :meal_time_id
  validates_presence_of :food_id
end