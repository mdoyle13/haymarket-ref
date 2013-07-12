class EventInquiriesController < ApplicationController

  before_filter :find_all_event_inquiries
  before_filter :find_page
  
  def new
    @event_inquiry = EventInquiry.new
  end
  
  def create
    @event_inquiry = EventInquiry.new(params[:event_inquiry])
    extras = params[:extras]
    @event_inquiry.extra_requirements = extras.join(" ") unless extras.blank?
    if @event_inquiry.save
      InquiryMailer.deliver_event_inquiry_notification(@event_inquiry)
      redirect_to thank_you_inquiries_url
    else
      render :new
    end
  end
  
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event_inquiry in the line below:
    present(@page)
  end

  def show
    @event_inquiry = EventInquiry.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event_inquiry in the line below:
    present(@page)
  end

protected

  def find_all_event_inquiries
    @event_inquiries = EventInquiry.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/event_inquiries")
  end

end
