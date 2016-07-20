require 'rails_helper'

feature 'Post Messages', js: true do
  before do
    FactoryGirl.build(:user)
    Message.delete_all
    visit root_path
  end
  # As a visitor
  # When I post a message that is valid
  # I expect to be told it's been posted and for it to exist in the database
  scenario 'post successful message' do
    fill_in 'message_message_body', with: 'Sample Message'
    page.find('.send-message').click
    expect(page).to have_content('New message:')
    expect(Message.count).to equal(1)
  end
  # As a visitor
  # When I post a message that is invalid
  # I expect to be told it's invalid and why, and for it to not exist in the database
  scenario 'try to create a message that\'s too long' do
    fill_in 'message_message_body', with: 'A message that is a lot more than 150 characters, maybe the user isn\'t being consice enough. Maybe they\'ve got a lot to say. Maybe the UX isn\'t clear enough. Who knows? It could be anything.'
    page.execute_script('$(\'.send-message\').prop(\'disabled\', false);')
    page.find('.send-message').click
    expect(page).to have_content('Your message must be 150 characters or less')
    expect(Message.count).to equal(0)
  end
end
