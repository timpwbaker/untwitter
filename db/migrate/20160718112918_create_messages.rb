class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_body
      t.date :publish_date

      t.timestamps null: false
    end
  end
end
