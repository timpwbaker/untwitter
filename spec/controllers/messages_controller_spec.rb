require 'rails_helper'
describe MessagesController do
  describe 'creating a new message' do
    # As a user
    # When I visit Index and try to post a valid message
    # It works
    context 'Can create message and visit index' do
      before do
        user = FactoryGirl.create(:user)
        Message.delete_all
        Message.create!(message_body: 'create a test message', user_id: user.id)
        get :index
      end
      it 'should allow creation of a message' do
        is_expected.to respond_with :ok
        is_expected.to render_with_layout :application
        is_expected.to render_template :index
        expect(Message.count).to equal(1)
      end
    end

    # As a user
    # When I try to post a valid message that is too long
    # It doesn't post the message, and tells me that it is too long
    context 'message is too long' do
      it 'should not allow creation of a message and return sensible error' do
        user = FactoryGirl.create(:user)
        message = Message.new(message_body: 'A message that is a lot more than 150 characters, maybe the user isn\'t being consice enough. Maybe they\'ve got a lot to say. Maybe the UX isn\'t clear enough. Who knows? It could be anything.', user_id: user.id)
        expect { message.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Message body Your message must be 150 characters or less')
      end
    end

    # As a user
    # When I try to post a valid message that is too long
    # It doesn't post the message, and tells me that it is too long
    context 'message is empty' do
      it 'should not allow creation of a message and return sensible error' do
        user = FactoryGirl.create(:user)
        message = Message.new(message_body: '', user_id: user.id)
        expect { message.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Message body Your Message contain at least 1 character')
      end
    end
  end
end
