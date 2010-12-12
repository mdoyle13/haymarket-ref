class Wine < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :wine_category
  validates_presence_of :wine_category

end
