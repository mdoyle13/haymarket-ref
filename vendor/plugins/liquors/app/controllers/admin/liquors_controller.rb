class Admin::LiquorsController < Admin::BaseController

  crudify :liquor, :title_attribute => :name

end
