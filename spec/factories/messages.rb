FactoryGirl.define do
  factory :message do
  	association :user
    message_body "A sample message for testing the submission of a new message"
  end
end
