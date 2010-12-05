class Admin::BeersController < Admin::BaseController

	before_filter :load_beer_categories

  crudify :beer, :title_attribute => :name, :order => 'position ASC', :sortable => true

	private
	
	def load_beer_categories
		@beer_categories = BeerCategory.all
	end

end
