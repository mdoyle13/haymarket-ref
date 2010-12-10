class Subscriber < ActiveRecord::Base
	validates_uniqueness_of :email
	validates_format_of :email, :with => /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, :message => 'must be a valid email address.'
end
