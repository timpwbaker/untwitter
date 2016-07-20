require 'rails_helper'
# Feature: Home page
#   As a visitor
#   I want to delete messages
#   So that they're no there forever
feature 'Delete Messages', :js => true do
	scenario 'post successful message' do
		@user = FactoryGirl.create(:user)
		message = FactoryGirl.create(:message, user_id: @user.id)
		visit root_path
		page.find("#delete-message#{message.id}").click
		expect(page).to have_content("Message deleted")
	end
end