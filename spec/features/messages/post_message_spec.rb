require 'rails_helper'
# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Post Messages', :js => true do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  scenario 'post successful message' do
    @user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message, user_id: @user.id)
    visit root_path
    fill_in 'message_message_body', :with => 'Sample Message'
    page.find(".send-message").click
    expect(page).to have_content("New message:")
  end

  scenario 'try to create unsuccessful message' do
    @user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:long_message, user_id: @user.id)
    visit root_path
    fill_in 'message_message_body', :with => 'Sample Message'
    page.find(".send-message").click
    expect(page).to have_content("New message:")
  end

end
