class Admin::FoodsController < Admin::BaseController

  crudify :food, :title_attribute => :name
  
  def new
    @food = Food.new
    @food.meal_times.build
  end
  
  def edit
    @food = Food.find(params[:id])
    @food.meal_times.build
  end

end
