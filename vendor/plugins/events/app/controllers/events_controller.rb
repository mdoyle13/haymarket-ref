class EventsController < ApplicationController

  before_filter :find_upcoming_events, :only => [:index]
  before_filter :find_page

  def index
    @events = Event.published
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  def show
    @event = Event.find(params[:id])
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end
  
  def beer_events
    @events = Event.published.beer
  end
  
  def theatre_events
    @events = Event.published.theatre
  end

protected

  def find_all_events
    @events = Event.find(:all, :order => "date DESC")
  end
  
  def find_upcoming_events
      @events = Event.find(:all, :conditions => ["end_date > ?", Time.now], :order => "date ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/events")
  end

end
