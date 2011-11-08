class Admin::SidebarsController < Admin::BaseController

  crudify :sidebar, :title_attribute => :title

end
