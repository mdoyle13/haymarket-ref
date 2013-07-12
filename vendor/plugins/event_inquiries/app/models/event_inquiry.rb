class EventInquiry < ActiveRecord::Base

  acts_as_indexed :fields => [:date, :time, :num_people, :occasion, :phone, :email, :notes, :extra_requirements]

  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :num_people
  validates_presence_of :occasion
  validates_presence_of :phone
  validates_presence_of :email
  validates_presence_of :notes
  validates_presence_of :name
end
