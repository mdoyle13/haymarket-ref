class HomeslidesController < ApplicationController

  before_filter :find_all_homeslides
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @homeslide in the line below:
    present(@page)
  end

  def show
    @homeslide = Homeslide.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @homeslide in the line below:
    present(@page)
  end

protected

  def find_all_homeslides
    @homeslides = Homeslide.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/homeslides")
  end

end
