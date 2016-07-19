class Message < ActiveRecord::Base
	belongs_to :user
	
	validates_length_of :message_body, maximum: 150, message: 'Your Message must be less than 150 characters'
	validates_length_of :message_body, minimum: 1, message: 'Your Message contain at least 1 character'
end
