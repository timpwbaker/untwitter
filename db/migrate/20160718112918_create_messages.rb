# Create the messages table
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_body
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
