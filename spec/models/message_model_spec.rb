require 'rails_helper'

describe Message do
  it do
    should validate_length_of(:message_body)
      .is_at_least(1).is_at_most(150)
      .with_short_message('Your Message contain at least 1 character')
      .with_long_message('Your message must be 150 characters or less')
  end
end
