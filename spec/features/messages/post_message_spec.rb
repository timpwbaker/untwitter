require 'rails_helper'
require 'spec_helper'
# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page', :js => true do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  scenario 'visit the home page' do
  	@user = FactoryGirl.create(:user)
  	message = FactoryGirl.create(:message, user_id: @user.id)
    visit root_path
    fill_in 'message_message_body', :with => 'Sample Message'
    page.find(".send-message").click
    expect(page).to have_content("New message:")
  end

end
