class Admin::HomeslidesController < Admin::BaseController

  crudify :homeslide, :title_attribute => :caption

end
