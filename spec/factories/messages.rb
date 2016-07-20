FactoryGirl.define do
  factory :message do
    association :user
    message_body 'A sample message for testing the submission of a new message'
  end

  factory :long_message do
    association :user
    message_body 'A message that is a lot more than 150 characters, maybe the user isn\'t being consice enough. Maybe they\'ve got a lot to say. Maybe the UX isn\'t clear enough. Who knows? It could be anything.'
  end
end
