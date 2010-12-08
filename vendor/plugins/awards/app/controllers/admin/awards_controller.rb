class Admin::AwardsController < Admin::BaseController

  crudify :award, :title_attribute => :event_name

end
