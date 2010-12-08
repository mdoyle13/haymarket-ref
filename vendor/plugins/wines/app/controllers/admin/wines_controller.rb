class Admin::WinesController < Admin::BaseController

  crudify :wine, :title_attribute => :name

end
