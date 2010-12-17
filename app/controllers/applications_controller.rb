class ApplicationsController < ApplicationController
  before_filter :login_required, :except=>['new', 'create']
  # GET /applications
  # GET /applications.xml
  def index
    @applications = Application.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.xml
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.xml
  def new
    @application = Application.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.xml
  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        ApplicationMailer.deliver_application_notification(@application)
        # ApplicationMailer.deliver_applicant_notification(@application)
        flash[:notice] = 'Thanks for your interest. We\'ve received your info.'
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @application, :status => :created, :location => root_path }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.xml
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        flash[:notice] = 'Application was successfully updated.'
        format.html { redirect_to(@application) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.xml
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to(applications_url) }
      format.xml  { head :ok }
    end
  end
  
  def retrieve
    begin
      @application = Application.find(params[:id])
    rescue
      flash[:notice] = 'That file was not found in our system. It may have expired. The files you have available to you are in the lists below.'
      redirect_to applications_path
    end

    unless @application.nil?
      if current_user
        send_file @application.cv.path, :type => @application.cv_content_type
      else
        flash[:notice] = "Please log in."
        redirect_to applications_path
      end
    end
  end
end
