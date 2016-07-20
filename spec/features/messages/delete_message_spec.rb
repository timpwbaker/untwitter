require 'rails_helper'
# As a visitor
# When I delete a message
# I expect to be told it's deleted and for it to not exist in the database
feature 'Delete Messages', js: true do
  scenario 'post successful message' do
    user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message, user_id: user.id)
    visit root_path
    page.find("#delete-message#{message.id}").click
    expect(page).to have_content('Message deleted')
    expect{ Message.find(message.id) }.to raise_error ActiveRecord::RecordNotFound
  end
end
