class Admin::TestimonialsController < Admin::BaseController

  crudify :testimonial, :title_attribute => :name

end
