class Admin::FoodsController < Admin::BaseController

  crudify :food, :title_attribute => :name

end
