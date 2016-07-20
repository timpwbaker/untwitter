# Users have usernames and own messages
class User < ActiveRecord::Base
  has_many :messages
end
