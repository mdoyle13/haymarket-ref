class Admin::EventInquiriesController < Admin::BaseController

  crudify :event_inquiry, :title_attribute => :date

end
