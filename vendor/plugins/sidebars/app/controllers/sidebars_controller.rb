class SidebarsController < ApplicationController

  before_filter :find_all_sidebars
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @sidebar in the line below:
    present(@page)
  end

  def show
    @sidebar = Sidebar.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @sidebar in the line below:
    present(@page)
  end

protected

  def find_all_sidebars
    @sidebars = Sidebar.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/sidebars")
  end

end
