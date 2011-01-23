class FoodsController < ApplicationController

  before_filter :find_all_foods
  before_filter :find_page
  before_filter :hide_sidebar

  def hide_sidebar
    @show_sidebar = false
  end

  def index
    #First Column
    @appetizers = FoodCategory.find_by_name("Appetizers")
    @sandwiches = FoodCategory.find_by_name("Sandwiches")
    @pizza = FoodCategory.find_by_name("Pizza")
    
    #Second Column
    @mussels = FoodCategory.find_by_name("Mussels")
    @chili_and_soup = FoodCategory.find_by_name("Chili & Soup")
    @entrees = FoodCategory.find_by_name("Entrees")
    @barbeque = FoodCategory.find_by_name("Barbeque")
    @desserts = FoodCategory.find_by_name("Desserts")
    
    #Third Column
    @salads = FoodCategory.find_by_name("Salads")
    @sides = FoodCategory.find_by_name("Sides")
    @housemade_sauces = FoodCategory.find_by_name("Housemade Sauces")
    @kids = FoodCategory.find_by_name("Kids")
  end

  def show
    @food = Food.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @food in the line below:
    present(@page)
  end

protected

  def find_all_foods
    @foods = Food.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/foods")
  end

end
