# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.

class ApplicationController < Refinery::ApplicationController
  before_filter :set_show_sidebar
  
  def set_show_sidebar
    @show_sidebar = true
  end
end
