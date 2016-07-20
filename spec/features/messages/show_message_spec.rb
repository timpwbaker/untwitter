require 'rails_helper'
# Feature: Home page
#   As a visitor
#   I want to see my messages shown
#   So that my friends can too
feature 'Show messages', js: true do
  scenario 'Create message and view it' do
    @user = FactoryGirl.create(:user)
    message = FactoryGirl.create(:message, user_id: @user.id)
    visit root_path
    expect(page).to have_selector '#message_' + message.id.to_s
  end
end
