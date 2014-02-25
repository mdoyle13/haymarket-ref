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
		@inquiry.send_to = @recipients.assoc(@inquiry.send_to)[1]
    if @inquiry.save
      if @inquiry.ham?
        begin
          InquiryMailer.deliver_notification(@inquiry)
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
		@recipients = [ 
		  ["Info/Comments", 'info@haymarketbrewing.com'],
		  ["Events", 'events@haymarketbrewing.com'],
		  #["Pete Crowley, Owner/Brewmaster", 'pete@haymarketbrewing.com'],
		  #['John Neurauter, Owner', 'john@haymarketbrewing.com'], 
		  ['Chris McCoy, Chef', 'christopher@haymarketbrewing.com']
		]
	end

end
