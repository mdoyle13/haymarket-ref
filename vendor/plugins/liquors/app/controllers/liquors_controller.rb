class LiquorsController < ApplicationController

  before_filter :find_all_liquors
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @liquor in the line below:
    present(@page)
  end

  def show
    @liquor = Liquor.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @liquor in the line below:
    present(@page)
  end

protected

  def find_all_liquors
    @liquors = Liquor.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/liquors")
  end

end
