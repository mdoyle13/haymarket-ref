class Application < ActiveRecord::Base
  validates_presence_of :name, :email, :position
  # has_attached_file :cv, :url => '/retrieve/:id' :path => ":rails_root/uploads/:id/:filename"
end
