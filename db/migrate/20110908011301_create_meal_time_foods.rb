class CreateMealTimeFoods < ActiveRecord::Migration
  def self.up
    create_table :meal_time_foods, :id => false do |t|
      t.integer :meal_time_id, :null => false
      t.integer :food_id, :null => false
    end
  end

  def self.down
    drop_table :meal_time_foods
  end
end
