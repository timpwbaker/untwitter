require 'rails_helper'
# As a visitor
# When I visit the homepage
# If messages exist, I expect to see them
feature 'Show messages', js: true do
  scenario 'Create message and view it' do
    @user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message, user_id: @user.id)
    visit root_path
    expect(page).to have_selector '#message_' + message.id.to_s
  end
end
