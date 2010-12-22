class AccoladesController < ApplicationController
  def index
   @awards = Award.published
   @testimonials = Testimonial.published
   @presses = Press.published
  end
end