class EventInquiry < ActiveRecord::Base

  acts_as_indexed :fields => [:date, :time, :num_people, :occasion, :phone, :email, :notes, :extra_requirements]

  validates_presence_of :date
  validates_uniqueness_of :date

end
