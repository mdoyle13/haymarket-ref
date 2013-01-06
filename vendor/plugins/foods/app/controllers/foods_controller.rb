class FoodsController < ApplicationController
  before_filter :find_page
  before_filter :hide_sidebar

  def hide_sidebar
    @show_sidebar = false
  end

  def index
    sp = Singleplatform.new
    response = sp.request('/restaurants/haymarket-pub--brewery/menu')
    entries = response["menus"][0]["entries"]

    @brunch     = sp.get_items_between(entries, "id", "s1279155", "s1279164")
    @lunch      = sp.get_items_between(entries, "id", "s1279164", "s1279171")
    @dinner     = sp.get_items_between(entries, "id", "s1279171", "s1279183")
    @late_night = sp.get_items_between(entries, "id", "s1279183", "")
  end

  def show
    @food = Food.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @food in the line below:
    present(@page)
  end

protected

  def find_page
    @page = Page.find_by_link_url("/foods")
  end

end
