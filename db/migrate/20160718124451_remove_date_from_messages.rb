class RemoveDateFromMessages < ActiveRecord::Migration
  def change
  	remove_column :messages, :publish_date
  end
end
