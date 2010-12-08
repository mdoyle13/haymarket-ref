class CreateFoodCategories < ActiveRecord::Migration
  def self.up
    create_table :food_categories do |t|
      t.string :name
    end
    
    FoodCategory.create :name => "Appetizer"
    FoodCategory.create :name => "Soup"
    FoodCategory.create :name => "Salad"
    FoodCategory.create :name => "Entreé"
  end

  def self.down
    drop_table :food_categories
  end
end
