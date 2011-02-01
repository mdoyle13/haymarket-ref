class BeersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  # before_filter :find_beer_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @beer in the line below:
    @drafts = Beer.drafts.live
    @haymarket_drafts = Beer.drafts.haymarket.on_draft
    @guest_drafts = Beer.drafts.not_haymarket.on_draft
    @bottles = Beer.bottles.on_bottle
    present(@page)
  end

  def show
    @beer = Beer.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @beer in the line below:
    present(@page)
  end
  
  def menu
  end

protected

  # def find_beer_categories
  #   @beer_categories = BeerCategory.all
  # end

  def find_page
    @page = Page.find_by_link_url("/beers")
  end

end
