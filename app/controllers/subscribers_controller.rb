class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscriber }
    end
  end
  
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    respond_to do |format|
      if @subscriber.save
        flash[:notice] = 'Thanks for signing up! You\'ll get email updates from us as things come together here.'
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @subscriber, :status => :created, :location => @subscriber }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscriber.errors, :status => :unprocessable_entity }
      end
    end
  end
end