class PressesController < ApplicationController

  before_filter :find_all_presses
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @press in the line below:
    present(@page)
  end

  def show
    @press = Press.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @press in the line below:
    present(@page)
  end

protected

  def find_all_presses
    @presses = Press.published
  end

  def find_page
    @page = Page.find_by_link_url("/presses")
  end

end
