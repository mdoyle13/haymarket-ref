class AwardsController < ApplicationController

  before_filter :find_all_awards
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @award in the line below:d
    present(@page)
  end

  def show
    # @award = Beer.awards.find(params[:id])
    @award = Award.find(params[:id])
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @award in the line below:
    present(@page)
  end

protected

  def find_all_awards
    # @awards = Beer.awards.published
    @awards = Award.published
  end

  def find_page
    @page = Page.find_by_link_url("/awards")
  end

end
