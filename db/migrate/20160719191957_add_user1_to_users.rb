class AddUser1ToUsers < ActiveRecord::Migration
  def change

  	User.create :username => 'Mr A User'


  end
end
