class Event < ActiveRecord::Base
  belongs_to :event_type

  acts_as_indexed :fields => [:name, :description, :location]

  validates_presence_of :name
  validates_uniqueness_of :name

  has_friendly_id :name, :use_slug => true

end
