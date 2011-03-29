class AccoladesController < ApplicationController
  def index
   @awards = Award.published(:order => 'year')
   @testimonials = Testimonial.published
   @presses = Press.published
   @award_year = @awards.group_by { |a| a.year.year }
  end
end