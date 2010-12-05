class Admin::EventsController < Admin::BaseController

  crudify :event, :title_attribute => :name

end
