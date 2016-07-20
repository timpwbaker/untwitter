require 'rails_helper'

feature 'Post Messages', :js => true do

  # Scenario: Visit the home page and try to post messages
  #   Given I am a visitor
  #   When I visit the home page
  #   I want to be able to post a message
  scenario 'post successful message' do
    @user = FactoryGirl.create(:user)
    visit root_path
    fill_in 'message_message_body', :with => 'Sample Message'
    page.find(".send-message").click
    expect(page).to have_content("New message:")
  end

  scenario 'try to create a message that\'s too long' do
    @user = FactoryGirl.create(:user)
    visit root_path
    fill_in 'message_message_body', :with => 'A message that is a lot more than 150 characters, maybe the user isn\'t being consice enough. Maybe they\'ve got a lot to say. Maybe the UX isn\'t clear enough. Who knows? It could be anything.'
    page.execute_script("$('.send-message').prop('disabled', false);")
    page.find(".send-message").click
    expect(page).to have_content("Your message must be 150 characters or less")
  end

end
