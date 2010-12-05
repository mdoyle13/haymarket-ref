class Admin::BeersController < Admin::BaseController
	before_filter :load_beer_categories

  crudify :beer, :title_attribute => :name, :order => 'position ASC', :sortable => true
  
  def new
    @beer = Beer.new
    @beer.beer_pricings.build
  end
  
  def edit
    @beer = Beer.find(params[:id])
    @beer.beer_pricings.build
  end

	private
	
	def load_beer_categories
		@beer_categories = BeerCategory.all
	end
end
