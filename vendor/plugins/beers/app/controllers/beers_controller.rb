class BeersController < ApplicationController

  before_filter :find_all_beers
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @beer in the line below:
    present(@page)
  end

  def show
    @beer = Beer.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @beer in the line below:
    present(@page)
  end

protected

  def find_all_beers
    @beer_categories = BeerCategory.all
  end

  def find_page
    @page = Page.find_by_link_url("/beers")
  end

end
