class CreateMealTimes < ActiveRecord::Migration
  def self.up
    create_table :meal_times do |t|
      t.string :name
    end
    
    MealTime.create :name => "Brunch"
    MealTime.create :name => "Lunch"
    MealTime.create :name => "Dinner"
    MealTime.create :name => "Late Night"
  end

  def self.down
    drop_table :meal_times
  end
end
