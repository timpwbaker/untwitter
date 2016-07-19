class Message < ActiveRecord::Base
	belongs_to :user
	
	validates_length_of :message_body, within: 1..150, too_long: 'Your message must be 150 characters or less', too_short: 'Your Message contain at least 1 character'
end
