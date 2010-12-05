class InquiriesController < ApplicationController

  before_filter :find_page, :only => [:create, :new]
	before_filter :set_recipients, :only => [:create, :new]
	
  def index
    redirect_to :action => "new"
  end

  def thank_you
    @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
		@inquiry.send_to = @recipients[@inquiry.send_to]
    if @inquiry.save
      if @inquiry.ham?
        begin
          InquiryMailer.deliver_notification(@inquiry, request)
        rescue
          logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
        end
      end

      redirect_to thank_you_inquiries_url
    else
      render :action => 'new'
    end
  end

protected

  def find_page
    @page = Page.find_by_link_url('/contact', :include => [:parts, :slugs])
  end

	def set_recipients
		@recipients = { "Pete Crowley" => 'pete@haymarketbrewing.com', 'John Neurauter' => 'john@haymarketbrewing.com', 'Chris Buccheri' => 'chris@haymarketbrewing.com'}
	end

end
