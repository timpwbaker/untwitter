# Add user 1 to the users table, it's required for application function
class AddUser1ToUsers < ActiveRecord::Migration
  def change
    User.create username: 'Mr A User'
  end
end
