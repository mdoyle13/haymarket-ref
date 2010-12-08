class Admin::PressesController < Admin::BaseController

  crudify :press, :title_attribute => :headline

end
